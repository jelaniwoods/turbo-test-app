# Redirecting after a form submission

> After a stateful request from a form submission, Turbo Drive expects the server to return an HTTP 303 redirect response, which it will then follow and use to navigate and update the page without reloading.
>
> **The exception to this rule is when the response is rendered with either a 4xx or 5xx status code. This allows form validation errors to be rendered by having the server respond with 422 Unprocessable Content and a broken server to display a “Something Went Wrong” screen on a 500 Internal Server Error.**


## Rendering server side validations in place (422)

```erb
<form
   action="/turbo/redirecting_after_a_form_submission"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post"
   >

   <input type="text" name="required" placeholder="leave this empty" style="<%%= "border: 2px solid red" if @unprocessable_entity %>">
  <input type="submit">
</form>
```

<form
   action="/turbo/redirecting_after_a_form_submission"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post"
   >

   <input type="text" name="required" placeholder="leave this empty" style="<%= "border: 2px solid red" if @unprocessable_entity %>">
  <input type="submit">
</form>

## Rendering server side validations in place (500)

Code:

```erb
<form
   action="/turbo/redirecting_after_a_form_submission"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post">
   <input type="text" name="required_500" placeholder="leave this empty" style="<%%= "border: 2px solid red" if @internal_server_error %>">
  <input type="submit">
</form>
```

Example:

<form
   action="/turbo/redirecting_after_a_form_submission"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post">
   <input type="text" name="required_500" placeholder="leave this empty" style="<%= "border: 2px solid red" if @internal_server_error %>">
  <input type="submit">
</form>


## Render server side validations in place (200)

<u>The following does not apply to forms that make `GET` requests.</u>

> The reason Turbo doesn’t allow regular rendering on 200’s from POST requestsis that browsers have built-in behavior for dealing with reloads on POST visits where they present a “Are you sure you want to submit this form again?” dialogue that Turbo can’t replicate. Instead, Turbo will stay on the current URL upon a form submission that tries to render, rather than change it to the form action, since a reload would then issue a GET against that action URL, which may not even exist.

The following form will submit but **won't update the current page**.

Code:

```erb
<form
   action="/turbo/redirecting_after_a_form_submission"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post">
   <input type="text" name="ok" placeholder="leave this empty" style="<%= "border: 2px solid green" if @ok %>">
  <input type="submit">
</form>
```

Example:

<form
   action="/turbo/redirecting_after_a_form_submission"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post">

   <input type="text" name="ok" placeholder="leave this empty" style="<%= "border: 2px solid green" if @ok %>">
  <input type="submit">
</form>


### Maintain scroll position after submit

https://github.com/hotwired/turbo/issues/37#issuecomment-1768347223

Code:

```erb
<turbo-frame id="random_id_for_this_page">
  <form
    action="/turbo/redirecting_after_a_form_submission"
    method="post"
    data-turbo="true"
    data-turbo-stream="true"
    data-turbo-method="post">
    <input type="text" name="frame_request" placeholder="leave this empty" style="<%%= "border: 2px solid red" if @frame_request %>">
    <input type="submit">
  </form>
</turbo-frame>
```

Example:

<turbo-frame id="random_id_for_this_page">
  <form
    action="/turbo/redirecting_after_a_form_submission"
    method="post"
    data-turbo="true"
    data-turbo-stream="true"
    data-turbo-method="post">
    <input type="text" name="frame_request" placeholder="leave this empty" style="<%= "border: 2px solid red" if @frame_request %>">
    <input type="submit">
  </form>
</turbo-frame>

---

## Rendering responses within a `<turbo-frame>`

> If the form submission is a GET request, you may render the directly rendered response by giving the form a data-turbo-frame target. If you’d like the URL to update as part of the rendering also pass a data-turbo-action attribute.

#### [GET] Rendering `<turbo-frame>` from next page

Code:

```html
<form
   action="/examples/two"
   method="get"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="get"
   data-turbo-frame="form-submit-get"
   >
  <input type="submit">
</form>

<turbo-frame id="form-submit-get">
  <p style="padding: 1rem; border: 1px solid black;">
    submit the form and I'll change!
  </p>
</turbo-frame>
```

The page that the form actions renders looks like

```html
<turbo-frame id="form-submit-get">
  <p style="border: 1px solid blue; padding: 1rem">[GET] this is content rendered from a completely different controller action</p>
</turbo-frame>
```

Example:

<form
   action="/examples/two"
   method="get"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="get"
   data-turbo-frame="form-submit-get"
   >
  <input type="submit">
</form>

<turbo-frame id="form-submit-get">
  <p style="padding: 1rem; border: 1px solid black;">
    submit the form and I'll change!
  </p>
</turbo-frame>

#### [POST] Rendering frame from  _redirected_ page within `<turbo-frame>`

```html
<form
   action="/examples/two"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post"
   data-turbo-frame="form-submit-post"
   >
  <input type="submit">
</form>

<turbo-frame id="form-submit-post">
  <p style="padding: 1rem; border: 1px solid black;">
    submit the form and I'll change!
  </p>
</turbo-frame>
```

The page that the form redirects to looks like


```html
<turbo-frame id="form-submit-post">
  <p style="border: 1px solid blue; padding: 1rem">[POST] this is content rendered from a completely different controller action</p>
</turbo-frame>
```

Example:

<form
   action="/examples/two"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post"
   data-turbo-frame="form-submit-post"
   >
  <input type="submit">
</form>

<turbo-frame id="form-submit-post">
  <p style="padding: 1rem; border: 1px solid black;">
    submit the form and I'll change!
  </p>
</turbo-frame>

