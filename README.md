# Clarke Slack Documentation

Clarke Slack is [Clarke](https://github.com/applidium/clarke/) UI plugin to interact with the [Slack Platform](https://api.slack.com/#read_the_docs).

## API Route

In your slack route code
```
ruby
require 'clarke'
require 'clarke/slack'

post '/slack' do
  parameters = JSON.parse(params[:payload])
  return render json: {}, status: 403 unless valid_slack_token(parameters)
  Clarke.process(Clarke::Slack, parameters)
end
```

## Events

There are 3 types of events:
* `TextMessage` (include `Clarke::TextMessage`)
* `TextCommand` (include `Clarke::TextMessage`) - TODO
* `Button` (include `Clarke::Button`) - TODO

All the Slack Events have to the following attributes:
* `response_url`
* `timestamp`
* `sender` (instance of `Clarke::Slack::User`)

### TextMessage
A `TextMessage` have to the following attribute: `text`

### TextCommand
A `TextCommand` have to the following attributes: `command`, `text` and
`parameters`

### Button
A `Button` have to the following attributes: `action` that is an instance of
`Clarke::Slack::Action` (with a `name` and a `value`) and `callback_id`

## Responses

There are 3 types of responses:

* `TextMessage` - TODO

* `EphemeralMessage` - TODO

* `Button` - TODO

### TextMessage
A `TextMessage` have to the following attribute: `text`.
A response is converted in TextMessage if it contains a text and no buttons or ephemeral options.

### EphemeralMessage
This send a text message, only visible for the recipient.
A `EphemeralMessage` has the following attribute: `text`.
A message is converted in `EphemeralMessage` if the option ephemeral is added
into the response.

### ButtonTemplate
A `ButtonTemplate` has the following attributes : `text`, `buttons`, `options` which
contains a `callback_id` and could contain `color` and `sub_text` attributes.
In each button, is stored different attributes : `name`, `text`, `value`.
A response is converted into `ButtonTemplate` if it has a text and buttons.

Different slack API URL are stored into `Clarke::Slack::Config`:
      API\_SEND\_MESSAGE = "https://slack.com/api/chat.postMessage?"
      API\_USER\_LIST = "https://slack.com/api/users.list?"
      API\_CHANNEL\_LIST = "https://slack.com/api/channels.list?"
      API\_USERGROUP\_LIST = "https://slack.com/api/usergroups.list?"

