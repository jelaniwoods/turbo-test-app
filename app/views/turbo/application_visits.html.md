all examples are with the assumption that Turbo is _opt-in_ and globally off.

# Application Visits

## Links

### Advance

A simple "how to make a link submit a TURBO_STREAM GET request" with the default "advance" action where the history of page navigation is remembered.

Code:

```html
<a href="/examples/one"
    data-turbo="true"
    data-turbo-stream="true"
    data-action="advance">Advance</a>
```


Example:

<a href="/examples/one"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="advance">Advance</a>


The docs say you can specify a fragment in the href and Turbo Drive will autoscroll to it.

Code:

```html
<a href="/examples/one#advance"
    data-turbo="true"
    data-turbo-stream="true"
    data-action="advance">Advance (with fragment)</a>
```


Example:

<a href="/examples/one#advance"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="advance">Advance (with fragment)</a>

- \[BUG\] - https://github.com/hotwired/turbo/issues/211


### Replace

How to replace the current page _and_ the latest page the browser remembers


Same thing, but with fragment in `href`

Code:

```html
<a href="/"
    data-turbo="true"
    data-turbo-stream="true"
    data-action="replace">Replace</a>
```

Example:

<a href="/"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="replace">Replace</a>


Code:

```html
<a href="#replace"
    data-turbo="true"
    data-turbo-stream="true"
    data-action="replace">Replace (with fragment)</a>
```


Example:

<a href="#replace"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="replace">Replace (with fragment)</a>

- \[BUG\] - https://github.com/hotwired/turbo/issues/211

