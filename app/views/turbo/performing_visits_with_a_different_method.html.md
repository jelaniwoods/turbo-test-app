# Performing visits with a different method

#### Aside from `GET`, you can make a link use a different HTTP method.

https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Methods#safe_idempotent_and_cacheable_request_methods

```html
<a href="/turbo/performing_visits_with_a_different_method"
     data-turbo="true"
     data-turbo-stream="true"
     data-turbo-method="post"
     data-action="advance">POST request</a>
```

<a href="/turbo/performing_visits_with_a_different_method"
     data-turbo="true"
     data-turbo-stream="true"
     data-turbo-method="post"
     data-action="advance">POST request</a>

```html
<a href="/turbo/performing_visits_with_a_different_method"
     data-turbo="true"
     data-turbo-stream="true"
     data-turbo-method="patch"
     data-action="advance">PATCH request</a>
```

<a href="/turbo/performing_visits_with_a_different_method"
     data-turbo="true"
     data-turbo-stream="true"
     data-turbo-method="patch"
     data-action="advance">PATCH request</a>

```html
<a href="/turbo/performing_visits_with_a_different_method"
     data-turbo="true"
     data-turbo-stream="true"
     data-turbo-method="delete"
     data-action="advance">DELETE request</a>
```

<a href="/turbo/performing_visits_with_a_different_method"
     data-turbo="true"
     data-turbo-stream="true"
     data-turbo-method="delete"
     data-action="advance">DELETE request</a>

```html
<a href="/turbo/performing_visits_with_a_different_method"
     data-turbo="true"
     data-turbo-stream="true"
     data-turbo-method="put"
     data-action="advance">PUT request</a>
```

<a href="/turbo/performing_visits_with_a_different_method"
     data-turbo="true"
     data-turbo-stream="true"
     data-turbo-method="put"
     data-action="advance">PUT request</a>

---

#### `HEAD`, `OPTIONS`, `TRACE`, and `CONNECT` are processed as `POST`

```html
<a href="/turbo/performing_visits_with_a_different_method"
     data-turbo="true"
     data-turbo-stream="true"
     data-turbo-method="head"
     data-action="advance">HEAD request</a>
```

<a href="/turbo/performing_visits_with_a_different_method"
     data-turbo="true"
     data-turbo-stream="true"
     data-turbo-method="head"
     data-action="advance">HEAD request</a>

```html
<a href="/turbo/performing_visits_with_a_different_method"
     data-turbo="true"
     data-turbo-stream="true"
     data-turbo-method="options"
     data-action="advance">OPTIONS request</a>
```

<a href="/turbo/performing_visits_with_a_different_method"
     data-turbo="true"
     data-turbo-stream="true"
     data-turbo-method="options"
     data-action="advance">OPTIONS request</a>

```html
<a href="/turbo/performing_visits_with_a_different_method"
     data-turbo="true"
     data-turbo-stream="true"
     data-turbo-method="trace"
     data-action="advance">TRACE request</a>
```

<a href="/turbo/performing_visits_with_a_different_method"
     data-turbo="true"
     data-turbo-stream="true"
     data-turbo-method="trace"
     data-action="advance">TRACE request</a>

```html
<a href="/turbo/performing_visits_with_a_different_method"
     data-turbo="true"
     data-turbo-stream="true"
     data-turbo-method="connect"
     data-action="advance">CONNECT request</a>
```

<a href="/turbo/performing_visits_with_a_different_method"
     data-turbo="true"
     data-turbo-stream="true"
     data-turbo-method="connect"
     data-action="advance">CONNECT request</a>
