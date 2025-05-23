
1. [Application Visits](/turbo/application_visits)
2. [Restoration Visits](/turbo/restoration_visits)
3. [Canceling Visits](/turbo/canceling_visits)
4. [Custom Rendering](/turbo/custom_rendering)
5. [Pausing Rendering](/turbo/pausing_rendering)
6. [Pausing Requests](/turbo/pausing_requests)
7. [Performing Visits With a Different Method](/turbo/performing_visits_with_a_different_method)
8. [Requiring Confirmation for a Visit](/turbo/requiring_confirmation_for_a_visit)
9. [Disabling Turbo Drive on Specific Links or Forms](/turbo/disabling_turbo_drive_on_specific_links_or_forms)
10. [View transitions](/turbo/view_transitions)
11. [Displaying Progress](/turbo/displaying_progress)
12. [Reloading When Assets Change](/turbo/reloading_when_assets_change)
13. [Removing Assets When They Change](/turbo/removing_assets_when_they_change)
14. [Ensuring Specific Pages Trigger a Full Reload](/turbo/ensuring_specific_pages_trigger_a_full_reload)
15. [Setting a Root Location](/turbo/setting_a_root_location)
16. [Form Submissions](/turbo/form_submissions)
17. [Redirecting After a Form Submission](/turbo/redirecting_after_a_form_submission)
18. [Streaming After a Form Submission](/turbo/streaming_after_a_form_submission)
19. [Prefetching Links on Hover](/turbo/prefetching_links_on_hover)
20. [Preload Links Into the Cache](/turbo/preload_links_Into_the_cache)
21. [Ignored Paths](/turbo/ignored_paths)

---

## TODOs

- [ ] Update syntax highlighting theme. (I like the RailsCast theme, maybe import or make that)
  - I think the RailsCast "theme" is using `CodeRay`, which operates differently than `Rouge` and means I probably need to write something custom to have it work seamlessly with `markdown_views`. Or I need to find/extract the `CodeRay` CSS to work with Rouge.
  - CodeMirror 5 has a Railscasts theme! https://codemirror.net/5/demo/theme.html#railscasts
- [ ] Improve codeblock styling
  - [ ] being able to highlight specific lines and/or columns
- [ ] Improve fonts
- [ ] Find/Add table of content extension to `markdown_views` or `commonmark`
- [ ] Figure out how to stream server log to specific pages for demo purposes
- [x] Fix tasklist
  - [ ] Improve tasklist styling
- [ ] Make headers reveal permalinks on hover
- [ ] Add navigation bar or main TOC based on index on other pages
- [ ] Make codeblocks copyable
- [ ] Make autolinks open in new tab by default
