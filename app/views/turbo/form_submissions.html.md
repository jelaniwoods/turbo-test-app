# Form submissions

[GET] turbo stream request

Code:

```html
<form
   action="/"
   method="get"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="get"
   >
  <input type="submit" value="GET request">
</form>
```

Example:

<form
   action="/"
   method="get"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="get"
   >
  <input type="submit" value="GET request">
</form>


[POST] turbo stream request

```html
<form
   action="/"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post"
   >
  <input type="submit" value="POST request">
</form>
```

<form
   action="/"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post"
   >
  <input type="submit" value="POST request">
</form>

[PATCH] turbo stream request

```html
<form
   action="/"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="patch"
   >
  <input type="hidden" name="_method" value="patch" autocomplete="off">
  <input type="submit" value="PATCH request">
</form>
```

<form
   action="/"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="patch"
   >
  <input type="hidden" name="_method" value="patch" autocomplete="off">
  <input type="submit" value="PATCH request">
</form>

[DELETE] turbo stream request

```html
<form
   action="/"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="delete"
   >
  <input type="hidden" name="_method" value="delete" autocomplete="off">
  <input type="submit" value="DELETE request">
</form>
```

<form
   action="/"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="delete"
   >
  <input type="hidden" name="_method" value="delete" autocomplete="off">
  <input type="submit" value="DELETE request">
</form>

maybe I can tail the logs and live display them to actually prove that they are making the expected requests.

https://guides.rubyonrails.org/form_helpers.html#forms-with-patch-put-or-delete-methods
