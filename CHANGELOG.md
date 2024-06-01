### Features

- Support http2-prior-knowledge, see [#356](https://github.com/ducaale/xh/pull/356) (@zuisong)
- Directly bind to interface name on supported platforms, see [#359](https://github.com/ducaale/xh/pull/359) (@ducaale)
- Enable stream when content-type is `text/event-stream`, see [#360](https://github.com/ducaale/xh/pull/360) (@zuisong)
- Decode utf-8 encoded string when formatting non-streaming JSON response, see [#361](https://github.com/ducaale/xh/pull/361) (@zuisong)

### Other

- Use `serde-transcode` to optimize JSON formatting, see [#362](https://github.com/ducaale/xh/pull/357) (@blyxxyz)
- Upgrade to hyper v1, see [#357](https://github.com/ducaale/xh/pull/362) (@zuisong)