all examples are with the assumption that Turbo is _opt-in_ and globally off.

# Application Visits

## Links

### Advance

A simple "how to make a link submit a `TURBO_STREAM` `GET` request" with the default "advance" action where the history of page navigation is remembered.

Code:

```html
<a href="/turbo/application_visits"
    data-turbo="true"
    data-turbo-stream="true"
    data-action="advance">Advance</a>
```


Example:

<a href="/turbo/application_visits"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="advance">Advance</a>


The docs say you can specify a fragment in the href and Turbo Drive will autoscroll to it.

> If the visit’s location includes an anchor, Turbo Drive will attempt to scroll to the anchored element. Otherwise, it will scroll to the top of the page.

(_spoiler: it doesn't work_)

Code:

```html
<a href="/turbo/application_visits#advance"
    data-turbo="true"
    data-turbo-stream="true"
    data-action="advance">Advance (with fragment)</a>
```


Example:

<a href="/turbo/application_visits#advance"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="advance">Advance (with fragment)</a>

- \[BUG\] - https://github.com/hotwired/turbo/issues/211


### Replace

How to replace the current page _and_ the latest page the browser remembers


Same thing, but with fragment in `href`

Code:

```html
<a href="/turbo/application_visits"
    data-turbo="true"
    data-turbo-stream="true"
    data-action="replace">Replace</a>
```

Example:

<a href="/turbo/application_visits"
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

