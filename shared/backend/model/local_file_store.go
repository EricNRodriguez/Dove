package model

import (
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
)

type localFileStore struct {
	rootDir string
}

func NewLocalFileStore(rootDir string) *localFileStore {
	return &localFileStore{
		rootDir: rootDir,
	}
}

func (s *localFileStore) GetObject(path string) (f []byte, err error) {
	return ioutil.ReadFile(s.getTotalPath(path))
}

func (s *localFileStore) PutObject(path string, content []byte) error {
	totalPath := s.getTotalPath(path)
	s.ensureDirExists(totalPath)
	return ioutil.WriteFile(totalPath, content, 0644)
}

func (s *localFileStore) getTotalPath(localPath string) string {
	return fmt.Sprintf("%s/%s", s.rootDir, localPath)
}


func (s *localFileStore) ensureDirExists(fileName string) {
	dirName := filepath.Dir(fileName)
	if _, serr := os.Stat(dirName); serr != nil {
		merr := os.MkdirAll(dirName, os.ModePerm)
		if merr != nil {
			panic(merr)
		}
	}
}
