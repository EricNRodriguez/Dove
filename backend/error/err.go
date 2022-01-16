package error

import "fmt"

type Err struct {
	externalMessage string
	error
}

func (e Err) ExternalError() string {
	return e.externalMessage
}

func (e Err) Error() string {
	return fmt.Sprintf("%s | %s\n", e.externalMessage, e.error.Error())
}

type ResourceNotFoundError struct {
	Err
}

func NewResourceNotFoundError(err error, externalMessage string) ResourceNotFoundError {
	return ResourceNotFoundError{Err{
		error: err,
		externalMessage: externalMessage,
	}}
}

type NotAuthorizedError struct {
	Err
}

func NewNotAuthorizedError(err error, externalMessage string) NotAuthorizedError {
	return NotAuthorizedError{Err{
		error: err,
		externalMessage: externalMessage,
	}}
}

type InvalidRequestDataError struct {
	Err
}

func NewInvalidRequestDataError(err error, externalMessage string) InvalidRequestDataError {
	return InvalidRequestDataError{Err{
		error: err,
		externalMessage: externalMessage,
	}}
}

type ForbiddenError struct {
	Err
}

func NewForbiddenError(err error, externalMessage string) ForbiddenError {
	return ForbiddenError{Err{
		error: err,
		externalMessage: externalMessage,
	}}
}

type ResourceAlreadyExistsError struct {
	Err
}

func NewResourceAlreadyExistsError(err error, externalMessage string) ResourceAlreadyExistsError {
	return ResourceAlreadyExistsError{Err{
		error: err,
		externalMessage: externalMessage,
	}}
}
