
import { Context } from './Context'


class FooterYearUpdateError extends Error {

  isFooterYearUpdateError = true

  sdk = 'FooterYearUpdate'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  FooterYearUpdateError
}

