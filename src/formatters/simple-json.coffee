sloc    = require '../sloc'
i18n    = require '../i18n'
helpers = require '../helpers'
align   = helpers.alignRight
col     = 20
colors  =
  source  : "green"
  comment : "cyan"
  empty   : "yellow"

stat = (data, options) ->

  if data.badFile
    return "#{align i18n.en.Error, col} :  #{i18n.en.BadFile}"

  str = for k in options.keys when (x = data.stats[k])?
    n = if (c = colors[k])? and (i = String(x)[c])? then i else x
    "#{align i18n.en[k], col} :  #{n}"

  str.join '\n'

module.exports = (data, options={}, fmtOpts) ->
  JSON.stringify data.summary, null, (if 'no-indent' in fmtOpts then 0 else 2)
