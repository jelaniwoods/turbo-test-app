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

---

Events:

https://hotwire.io/documentation/turbo/reference/events

<form
   id="events"
   action="/examples/five"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post"
   data-turbo-frame="form-submit-events"
   >
  <input type="submit" value="Execute">
</form>

<ol>
  <li id="start" style="color: grey;">turbo:submit-start</li>
  <li id="request" style="color: grey;">turbo:before-fetch-request</li>
  <li id="response" style="color: grey;">turbo:before-fetch-response</li>
  <li id="end" style="color: grey;">turbo:submit-end</li>
</ol>

<turbo-frame id="form-submit-events">
  <p style="padding: 1rem; border: 1px solid grey">
    form submission events [UNSTARTED]
  </p>
</turbo-frame>

<script>
  var form = document.getElementById("events")
  form.addEventListener("turbo:submit-start", async (event) => {
    document.getElementById("start").style.color = "green"
  })

  form.addEventListener("turbo:before-fetch-request", async (event) => {
    document.getElementById("request").style.color = "green"
  })

  form.addEventListener("turbo:before-fetch-response", async (event) => {
    document.getElementById("response").style.color = "green"
  })

  form.addEventListener("turbo:submit-end", async (event) => {
    document.getElementById("end").style.color = "green"
  })
</script>

<br>

<form
   id="events2"
   action="/examples/five"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post"
   data-turbo-frame="form-submit-events2"
   >
  <input type="submit" value="Cancelling Form Submission">
</form>

Events:
<ol>
  <li id="start2" style="color: grey;">turbo:submit-start</li>
  <li id="request2" style="color: grey;">turbo:before-fetch-request</li>
  <li id="response2" style="color: grey;">turbo:before-fetch-response</li>
  <li id="end2" style="color: grey;">turbo:submit-end</li>
</ol>

<turbo-frame id="form-submit-events2">
  <p style="padding: 1rem; border: 1px solid grey">
    form submission events [UNSTARTED]
  </p>
</turbo-frame>

<script>
  var form = document.getElementById("events2")
  form.addEventListener("turbo:submit-start", async (event) => {
      document.getElementById("start2").style.color = "green"
      event.detail.formSubmission.stop()
  })

  form.addEventListener("turbo:before-fetch-request", async (event) => {
    document.getElementById("request2").style.color = "green"
  })

  form.addEventListener("turbo:before-fetch-response", async (event) => {
    document.getElementById("response2").style.color = "green"
  })

  form.addEventListener("turbo:submit-end", async (event) => {
    document.getElementById("end2").style.color = "green"
  })
</script>


#### disable form fields after submission

<form
    id="events3"
    class="row g-3"
    action="/examples/five"
    method="post"
    data-turbo="true"
    data-turbo-stream="true"
    data-turbo-method="post"
    data-turbo-frame="form-submit-events"
    >
  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">Email</label>
    <input type="email" class="form-control" id="inputEmail4">
  </div>
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">Password</label>
    <input type="password" class="form-control" id="inputPassword4">
  </div>
  <div class="col-12">
    <label for="inputAddress" class="form-label">Address</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
  </div>
  <div class="col-12">
    <label for="inputAddress2" class="form-label">Address 2</label>
    <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
  </div>
  <div class="col-md-6">
    <label for="inputCity" class="form-label">City</label>
    <input type="text" class="form-control" id="inputCity">
  </div>
  <div class="col-md-4">
    <label for="inputState" class="form-label">State</label>
    <select id="inputState" class="form-select">
      <option selected>Choose...</option>
      <option>...</option>
    </select>
  </div>
  <div class="col-md-2">
    <label for="inputZip" class="form-label">Zip</label>
    <input type="text" class="form-control" id="inputZip">
  </div>
  <div class="col-12">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="gridCheck">
      <label class="form-check-label" for="gridCheck">
        Check me out
      </label>
    </div>
  </div>
  <div class="col-12">
    <button type="submit" class="btn btn-primary">Sign in (submit)</button>
  </div>
</form>

<turbo-frame id="form-submit-events3">
  <p style="padding: 1rem; border: 1px solid grey">
    form submission events [UNSTARTED]
  </p>
</turbo-frame>

<script>
  var form = document.getElementById("events3")
  form.addEventListener("turbo:submit-start", ( { target } ) => {
    for (const field of target.elements) {
      field.disabled = true
    }
  })

form.addEventListener("turbo:submit-end", ( { target } ) => {
    for (const field of target.elements) {
      field.disabled = false
    }
  })
</script>

