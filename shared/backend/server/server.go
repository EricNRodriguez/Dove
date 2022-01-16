package server

import (
	"bytes"
	"errors"
	"fmt"
	"github.com/EricNRodriguez/Dove/auth"
	"github.com/EricNRodriguez/Dove/middleware"
	"github.com/EricNRodriguez/Dove/util"
	"github.com/gorilla/mux"
	"io/ioutil"
	"log"
	"net/http"
	"time"
)

type HandlerFunc func(*auth.SessionContext, http.ResponseWriter, *http.Request)

type Server struct {
	router *mux.Router
	requestTimeout time.Duration
	addr string
	port int
}

func New(addr string, port int) (s *Server, err error) {
	router := mux.NewRouter()

	if router == nil {
		err = errors.New("failed to initialise mux router")
		return
	}

	s = &Server{
		router: router,
		addr: addr,
		port: port,
	}

	return
}

func (s *Server) InjectMiddleware(middlewareFunc mux.MiddlewareFunc) {
	s.router.Use(middlewareFunc)
	return
}

func (s *Server) InjectHandler(route string, handler HandlerFunc, method string) {
	s.router.HandleFunc(route, s.adaptServerHandler(handler)).Methods(method)
	return
}

func (s *Server) adaptServerHandler(handler HandlerFunc) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		s.logRequest(r)

		sessionContext := auth.NewMinimalSessionContext()
		if r.Header.Get(middleware.SessionContextKey) != "" {
			util.StrictDeserialize(r.Header.Get(middleware.SessionContextKey), sessionContext)
		}

		handler(sessionContext, w, r)

		return
	}
}

func (s *Server) logRequest(r *http.Request) {
	log.Printf("handling %s request to %s\n", r.Method, r.URL)

	buf, err := ioutil.ReadAll(r.Body)
	if err != nil {
		return
	}

	log.Println(string(buf))

	reader := ioutil.NopCloser(bytes.NewBuffer(buf))
	r.Body = reader
}

func (s *Server) Run() (err error) {
	addr := fmt.Sprintf("%s:%d", s.addr, s.port)
	log.Printf("listening and serving on %s\n", addr)
	err = http.ListenAndServe(addr, s.router)
	return
}