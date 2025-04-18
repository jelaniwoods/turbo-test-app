
#### can render server side validations in place (500)

```erb
<form
   action="/turbo/redirecting_after_a_form_submission"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post"
   >
   <input type="text" name="required_500" placeholder="leave this empty" style="<%%= "border: 2px solid red" if @internal_server_error %>">
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
   <input type="text" name="required_500" placeholder="leave this empty" style="<%= "border: 2px solid red" if @internal_server_error %>">
  <input type="submit">
</form>


#### maintain scroll after submit

https://github.com/hotwired/turbo/issues/37#issuecomment-1768347223

```erb
<turbo-frame id="form">
  <form
    action="/turbo/redirecting_after_a_form_submission"
    method="post"
    data-turbo="true"
    data-turbo-stream="true"
    data-turbo-method="post"
    >
    <input type="text" name="frame_request" placeholder="leave this empty" style="<%%= "border: 2px solid red" if @frame_request %>">
    <input type="submit">
  </form>
</turbo-frame>
```

<turbo-frame id="form">
  <form
    action="/turbo/redirecting_after_a_form_submission"
    method="post"
    data-turbo="true"
    data-turbo-stream="true"
    data-turbo-method="post"
    >
    <input type="text" name="frame_request" placeholder="leave this empty" style="<%= "border: 2px solid red" if @frame_request %>">
    <input type="submit">
  </form>
</turbo-frame>


#### **cannot** render server side validations in place (200)

<u>This does not apply to forms that make GET requests.</u>

> The reason Turbo doesn’t allow regular rendering on 200’s from POST requestsis that browsers have built-in behavior for dealing with reloads on POST visits where they present a “Are you sure you want to submit this form again?” dialogue that Turbo can’t replicate. Instead, Turbo will stay on the current URL upon a form submission that tries to render, rather than change it to the form action, since a reload would then issue a GET against that action URL, which may not even exist.

Code:

```erb
<form
   action="/turbo/redirecting_after_a_form_submission"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post"
   >
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
   data-turbo-method="post"
   >

   <input type="text" name="ok" placeholder="leave this empty" style="<%= "border: 2px solid green" if @ok %>">
  <input type="submit">
</form>
