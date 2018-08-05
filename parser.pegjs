Template
  = parts:Token*
  { return "with(data){var out='" + parts.join('') + "';return out;}" }

Token
  = At / Any

At
  = '@' value:( Subtitution / Expression / Code / Comment / Escape )
  { return value }

Subtitution
  = value:$( [A-Za-z_$] [A-Za-z_$0-9]* )
  { return "'+" + value + "+'" }

Expression
  = '{' value:$( Expression / JsString / JsComment / JsRegex / [^\}] )+ '}'
  { return "'+(" + value + ")+'" }

Code
  = ' ' value:$( !NewLine . )+ NewLine?
  { return "';" + value + ";out+='" }

Comment
  = '.' ( !NewLine . )+ NewLine?
  { return '' }

Escape
  = '@'
  { return '@' }

Any
  = '\b' { return '\\t'  }
  / '\f' { return '\\r'  }
  / '\n' { return '\\n'  }
  / '\r' { return '\\n'  }
  / '\t' { return '\\n'  }
  / '\v' { return '\\v'  }
  / "'"  { return "\\'"  }
  / "\\" { return "\\\\" }
  / .

JsString
  = "'" ( '\\' . / [^'] )* "'"
  / '"' ( '\\' . / [^"] )* '"'

JsComment
  = '//' ( !NewLine . )* NewLine
  / '/*' ( !'*/' . )* '*/'

JsRegex
  = '/' ( '\\' . / [^\/] )* "/"

NewLine
  = '\r\n' / '\r' / '\n'
