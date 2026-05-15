package core

type FooterYearUpdateError struct {
	IsFooterYearUpdateError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewFooterYearUpdateError(code string, msg string, ctx *Context) *FooterYearUpdateError {
	return &FooterYearUpdateError{
		IsFooterYearUpdateError: true,
		Sdk:              "FooterYearUpdate",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *FooterYearUpdateError) Error() string {
	return e.Msg
}
