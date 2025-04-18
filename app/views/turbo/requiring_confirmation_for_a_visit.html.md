# Requiring Confirmation for a Visit

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
