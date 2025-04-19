# Disabling turbo drive on specific links or forms

You can make turn Turbo off on specific links or forms with `data-turbo="false"` and they'll behave like normal.

---

Code:

```html
<a href="/turbo/disabling_turbo_drive_on_specific_links_or_forms"
     data-turbo="false">HTML request</a>
```

Example:

<a href="/turbo/disabling_turbo_drive_on_specific_links_or_forms"
     data-turbo="false">HTML request</a>

---


```html
<form
   action="/turbo/disabling_turbo_drive_on_specific_links_or_forms"
   method="post"
   data-turbo="false">
  <input type="submit" value="HTML request">
</form>
```

<form
   action="/turbo/disabling_turbo_drive_on_specific_links_or_forms"
   method="post"
   data-turbo="false">
  <input type="submit" value="HTML request">
</form>
