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


## Confirmation

Code:

```html
<a href="/"
     data-turbo="true"
     data-turbo-method="get"
     data-turbo-confirm="Do you want to leave this page?">Confirmation</a>
```

Example:

<a href="/"
     data-turbo="true"
     data-turbo-method="get"
     data-turbo-confirm="Do you want to leave this page?">Confirmation</a>



#### You can customize confirmation popup for all forms.

Code:

```html
  <script>
    document.addEventListener("turbo:load", function () {
      Turbo.config.forms.confirm = () => {
        let dialog = document.querySelector("dialog")
        dialog.showModal()
        return new Promise((resolve, reject) => {
          dialog.addEventListener("close", () => {
            resolve(dialog.returnValue == "confirm")
          }, { once: true })
        })
      }
    })
  </script>
```

```html
<a href="/"
     data-turbo="true"
     data-turbo-method="get"
     data-turbo-confirm="Do you want to leave this page?">Confirmation (custom)</a>

<dialog>
  <form action="/">
      <p>Are you sure?</p>
    <button value="cancel">Cancel</button>
    <button value="confirm">Confirm</button>
  </form>
</dialog>
```

Example:

<form
   action="/examples/three"
   method="get"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="get"
   data-turbo-frame="custom-confirmation"
   >
  <input type="submit" value="Load JS and override all turbo confirmations">
</form>

<turbo-frame id="custom-confirmation"></turbo-frame>

<a href="/"
     data-turbo="true"
     data-turbo-method="get"
     data-turbo-confirm="Do you want to leave this page?">Confirmation (custom)</a>

<dialog>
  <form action="/">
      <p>Are you sure?</p>
    <button value="cancel">Cancel</button>
    <button value="confirm">Confirm</button>
  </form>
</dialog>

---

## Form submissions

[GET] regular turbo stream request

Code:

```html
<form
   action="/"
   method="get"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="get"
   >
  <input type="submit">
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
  <input type="submit">
</form>


[POST] regular turbo stream request

```html
<form
   action="/"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post"
   >
  <input type="submit">
</form>
```

<form
   action="/"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post"
   >
  <input type="submit">
</form>

#### can customize submit/button text when submitting

```html
<form
   action="/"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="get"
   >
  <input type="submit" data-turbo-submits-with="hold on to your butts!">
</form>
```

<form
   action="/"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="get"
   >
  <input type="submit" data-turbo-submits-with="hold on to your butts!">
</form>

#### can render server side validations in place (422)

```erb
<form
   action="/examples/three"
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
   action="/examples/three"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post"
   >

   <input type="text" name="required" placeholder="leave this empty" style="<%= "border: 2px solid red" if @unprocessable_entity %>">
  <input type="submit">
</form>


#### can render server side validations in place (500)

```erb
<form
   action="/examples/three"
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
   action="/examples/three"
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
    action="/examples/three"
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
    action="/examples/three"
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
   action="/examples/three"
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
   action="/examples/three"
   method="post"
   data-turbo="true"
   data-turbo-stream="true"
   data-turbo-method="post"
   >

   <input type="text" name="ok" placeholder="leave this empty" style="<%= "border: 2px solid green" if @ok %>">
  <input type="submit">
</form>


#### can render response directly in turbo frame on current page [GET]

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

#### can render <em>redirected</em> response directly in turbo frame on current page [POST]

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

---


## Cancel requests

Code:

```html
<a href="/examples/five"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="advance">Visit will be cancelled</a>

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.7/gsap.min.js" integrity="sha512-f6bQMg6nkSRw/xfHw5BCbISe/dJjXrVGfz9BSDwhZtiErHwk7ifbmBEtF9vFW8UNIQPhV2uEFVyI/UHob9r7Cw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
  document.addEventListener("turbo:before-render", async (event) => {
    if (event.originalTarget.baseURI.includes("five")) {
      event.preventDefault()
    } else if (event.originalTarget.baseURI.includes("eight")) {
      event.detail.render = (currentElement, newElement) => {
        if (!document.documentElement.hasAttribute('data-turbo-preview')) {
          // from https://github.com/hotwired/turbo/blob/main/src/core/drive/page_renderer.ts#L149
          document.adoptNode(newElement);

          const oldImage = currentElement.querySelector('img');
          const newImage = newElement.querySelector('img');
          oldImage.setAttribute('style', 'opacity: 1; z-index: 10;');

          oldImage.insertAdjacentElement('afterend', newImage);

          newImage.addEventListener('load', () => {
            newImage.setAttribute(
              'style',
              'opacity: 0; z-index: 0; filter: invert(100%) blur(16px);'
            );
            gsap.to(oldImage, {
              opacity: 0,
              filter: 'invert(100%) blur(16px)',
              duration: 2,
              ease: 'power2.inOut',
            });
            gsap.to(newImage, {
              opacity: 1,
              filter: 'invert(0%) blur(0px)',
              duration: 2,
              ease: 'power2.inOut',
            });

            setTimeout(() => {
              oldImage.remove();
            }, 2000);
          });
        }
      }
    } else if(event.originalTarget.baseURI.includes("seven")) {
      event.preventDefault()
      await event.originalTarget.animate(
        [
          { transform: "rotate(0) scale(30)" },
          { transform: "rotate(360deg) scale(0.5)" },
        ], {
          duration: 2000,
          iteration: 1,
        }
      )
      event.detail.resume()
    }
  })
</script>
```

Example:

<a href="/examples/five"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="advance">Visit will be cancelled</a>

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.7/gsap.min.js" integrity="sha512-f6bQMg6nkSRw/xfHw5BCbISe/dJjXrVGfz9BSDwhZtiErHwk7ifbmBEtF9vFW8UNIQPhV2uEFVyI/UHob9r7Cw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
  document.addEventListener("turbo:before-render", async (event) => {
    if (event.originalTarget.baseURI.includes("five")) {
      event.preventDefault()
    } else if (event.originalTarget.baseURI.includes("eight")) {
      event.detail.render = (currentElement, newElement) => {
        if (!document.documentElement.hasAttribute('data-turbo-preview')) {
          // from https://github.com/hotwired/turbo/blob/main/src/core/drive/page_renderer.ts#L149
          document.adoptNode(newElement);

          const oldImage = currentElement.querySelector('img');
          const newImage = newElement.querySelector('img');
          oldImage.setAttribute('style', 'opacity: 1; z-index: 10;');

          oldImage.insertAdjacentElement('afterend', newImage);

          newImage.addEventListener('load', () => {
            newImage.setAttribute(
              'style',
              'opacity: 0; z-index: 0; filter: invert(100%) blur(16px);'
            );
            gsap.to(oldImage, {
              opacity: 0,
              filter: 'invert(100%) blur(16px)',
              duration: 2,
              ease: 'power2.inOut',
            });
            gsap.to(newImage, {
              opacity: 1,
              filter: 'invert(0%) blur(0px)',
              duration: 2,
              ease: 'power2.inOut',
            });

            setTimeout(() => {
              oldImage.remove();
            }, 2000);
          });
        }
      }
    } else if(event.originalTarget.baseURI.includes("seven")) {
      event.preventDefault()
      await event.originalTarget.animate(
        [
          { transform: "rotate(0) scale(30)" },
          { transform: "rotate(360deg) scale(0.5)" },
        ], {
          duration: 2000,
          iteration: 1,
        }
      )
      event.detail.resume()
    }
  })
</script>


## Custom Rendering

REFORMAT

<a href="/examples/eight"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="advance">custom render image</a>

<img src="https://images.pexels.com/photos/102104/pexels-photo-102104.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" width="100" alt="photo of apple">

<br>
<hr>
<br>

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

Events:

https://hotwire.io/documentation/turbo/reference/events

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

<br>

<a href="/examples/seven"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="advance">Pause rendering</a>
