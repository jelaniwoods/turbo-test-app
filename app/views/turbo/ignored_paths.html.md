# Ignored paths

Turbo Drive will not handle path/URLs that have `.` in the last segment _unless_ it ends in one of these file extensions:
- `.htm`
- `.html`
- `.xhtml`
- `.php`

```html
<form action="/messages.67" method="post">
  <!-- ignored -->
</form>

<form action="/messages.php.1" method="post" data-turbo="true">
  <!-- also ignored -->
</form>

<form action="/messages.json" method="post" data-turbo="true">
  <!-- also ignored -->
</form>
```

You can force Turbo to handle those routes by appending a `/` afterwards

```html
<form action="/messages/67" method="post">
  <!-- handled -->
</form>

<form action="/messages.67/action" method="post">
  <!-- also handled -->
</form>

<form action="/messages.php" method="post" data-turbo="true">
  <!-- also handled -->
</form>

<form action="/messages.json/" method="post" data-turbo="true">
  <!-- also handled -->
</form>

<form action="/messages.json/123" method="post" data-turbo="true">
  <!-- also handled -->
</form>
```
