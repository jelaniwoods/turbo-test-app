# Streaming after a form submission

Servers may also respond to form submissions with a Turbo Streams message by sending the header `Content-Type: text/vnd.turbo-stream.html` followed by one or more `<turbo-stream>` elements in the response body. This lets you update multiple parts of the page without navigating.

The following is a basic example. Turbo Stream tags will be covered more deeply in a later section.

---

Code:

```html
<form
   action="/examples/nine"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post">
  <input type="submit">
</form>

<ul id="element-to-append-to">
  <li>
    another list item will be appended under this
  </li>
<ul>
```

response

```rb
<turbo-stream action="append" target="element-to-append-to">
  <template>
    <li>
      This list item will be appended to the existing element with the DOM ID "element-to-append-to".
    </li>
  </template>
</turbo-stream>
```

<form
   action="/examples/nine"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post">
  <input type="submit">
</form>

<ul id="element-to-append-to">
  <li>
    another list item will be appended under this
  </li>
<ul>
