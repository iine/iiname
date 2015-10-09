var I18n = I18n || {};
I18n.translations = {"en":{"date":{"formats":{"default":"%Y-%m-%d","short":"%b %d","long":"%B %d, %Y"},"day_names":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"abbr_day_names":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"month_names":[null,"January","February","March","April","May","June","July","August","September","October","November","December"],"abbr_month_names":[null,"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"order":["year","month","day"]},"time":{"formats":{"default":"%a, %d %b %Y %H:%M:%S %z","short":"%d %b %H:%M","long":"%B %d, %Y %H:%M"},"am":"am","pm":"pm"},"support":{"array":{"words_connector":", ","two_words_connector":" and ","last_word_connector":", and "}},"number":{"format":{"separator":".","delimiter":",","precision":3,"significant":false,"strip_insignificant_zeros":false},"currency":{"format":{"format":"%u%n","unit":"$","separator":".","delimiter":",","precision":2,"significant":false,"strip_insignificant_zeros":false}},"percentage":{"format":{"delimiter":"","format":"%n%"}},"precision":{"format":{"delimiter":""}},"human":{"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"kb":"KB","mb":"MB","gb":"GB","tb":"TB"}},"decimal_units":{"format":"%n %u","units":{"unit":"","thousand":"Thousand","million":"Million","billion":"Billion","trillion":"Trillion","quadrillion":"Quadrillion"}}}},"errors":{"format":"%{attribute} %{message}","messages":{"inclusion":"is not included in the list","exclusion":"is reserved","invalid":"is invalid","confirmation":"doesn't match %{attribute}","accepted":"must be accepted","empty":"can't be empty","blank":"can't be blank","present":"must be blank","too_long":{"one":"is too long (maximum is 1 character)","other":"is too long (maximum is %{count} characters)"},"too_short":{"one":"is too short (minimum is 1 character)","other":"is too short (minimum is %{count} characters)"},"wrong_length":{"one":"is the wrong length (should be 1 character)","other":"is the wrong length (should be %{count} characters)"},"not_a_number":"is not a number","not_an_integer":"must be an integer","greater_than":"must be greater than %{count}","greater_than_or_equal_to":"must be greater than or equal to %{count}","equal_to":"must be equal to %{count}","less_than":"must be less than %{count}","less_than_or_equal_to":"must be less than or equal to %{count}","other_than":"must be other than %{count}","odd":"must be odd","even":"must be even","taken":"has already been taken"}},"activerecord":{"errors":{"messages":{"record_invalid":"Validation failed: %{errors}","restrict_dependent_destroy":{"one":"Cannot delete record because a dependent %{record} exists","many":"Cannot delete record because dependent %{record} exist"}}}},"datetime":{"distance_in_words":{"half_a_minute":"half a minute","less_than_x_seconds":{"one":"less than 1 second","other":"less than %{count} seconds"},"x_seconds":{"one":"1 second","other":"%{count} seconds"},"less_than_x_minutes":{"one":"less than a minute","other":"less than %{count} minutes"},"x_minutes":{"one":"1 minute","other":"%{count} minutes"},"about_x_hours":{"one":"about 1 hour","other":"about %{count} hours"},"x_days":{"one":"1 day","other":"%{count} days"},"about_x_months":{"one":"about 1 month","other":"about %{count} months"},"x_months":{"one":"1 month","other":"%{count} months"},"about_x_years":{"one":"about 1 year","other":"about %{count} years"},"over_x_years":{"one":"over 1 year","other":"over %{count} years"},"almost_x_years":{"one":"almost 1 year","other":"almost %{count} years"}},"prompts":{"year":"Year","month":"Month","day":"Day","hour":"Hour","minute":"Minute","second":"Seconds"}},"helpers":{"select":{"prompt":"Please select"},"submit":{"create":"Create %{model}","update":"Update %{model}","submit":"Save %{model}"}},"style_guide":{"buttons":{"disabled_anchor":"Make `\u003ca\u003e` buttons look unclickable by adding the `.disabled` class\n","disabled_element":"Make `\u003cbutton\u003e` buttons look unclickable by adding the `.disabled` class\n","sizes":"Fancy larger or smaller buttons? Add `.btn-large`, `.btn-small`, or `.btn-mini` for additional sizes.\n","types":"Need different buttons for different occasions?  Add some class!\n"},"forms":{"controls_checkbox_and_radio":"Checkboxes are for selecting one or several options in a list while radios are for selecting one option from many. Add the `.inline` class to a series of checkboxes or radios for controls to appear on the same line.\n","controls_input":"Most common form control, text-based input fields. Includes support for all HTML5 types: text, password, datetime, datetime-local, date, month, time, week, number, email, url, search, tel, and color. Requires the use of a specified `type` at all times.\n","controls_select":"Use the default option or specify a `multiple=\"multiple\"` to show multiple options at once.\n","controls_textarea":"Form control which supports multiple lines of text. Change the `rows` attribute as necessary.\n","default_styles":"Individual form controls receive styling, but without any required base class on the `\u003cform\u003e` or large changes in markup. Results in stacked, left-aligned labels on top of form controls.\n","horizontal":"Right align labels and float them to the left to make them appear on the same line as controls. Requires the most markup changes from a default form:\n  * Add `.form-horizontal` to the form\n  * Wrap labels and controls in `.control-group`\n  * Add `.control-label` to the label\n  * Wrap any associated controls in `.controls` for proper alignment\n","inline":"Add `.form-inline` for left-aligned labels and inline-block controls for a compact layout.\n","search":"Add `.form-search` to the form and `.search-query` to the `\u003cinput\u003e` for an extra-rounded text input.\n"},"images":{"dropdown_icons":"Dropdown in a button group.","form_fields":"Icons in a form field.","icon_buttons":"Button group in a button toolbar.","small_button":"Small button with an icon.","placeholders":"Default shapes for placeholder images.","navigation":"Icons inside of navigation lists."},"tables":{"default_style":"For basic styling – light padding and only horizontal dividers – add the base class `.table` to any `\u003ctable\u003e`.\n","striped":"`.table-striped` adds zebra-striping to any table row within the `\u003ctbody\u003e` via the `:nth-child` CSS selector (not available in IE7-IE8).\n","bordered":"`.table-bordered` adds borders and rounded corners to the table.\n","hover":"`.table-hover` enables a hover state on table rows within a `\u003ctbody\u003e`.\n","condensed":"`.table-condensed` makes tables more compact by cutting cell padding in half.\n","row_classes":"Use contextual classes to color table rows.\n"},"typography":{"body_copy":"Bootstrap's global default `font-size` is \u003cstrong\u003e14px\u003c/strong\u003e, with a `line-height` of \u003cstrong\u003e20px\u003c/strong\u003e. This is applied to the `\u003cbody\u003e` and all paragraphs. In addition, `\u003cp\u003e` (paragraphs) receive a bottom margin of half their line-height (10px by default). Make a paragraph stand out by adding `.lead`.\n","headings":"All HTML headings, `\u003ch1\u003e` through `\u003ch6\u003e` are available.\n","code_inline":"Use `\u003ccode\u003e` for inline snippets of code.\n","code_blocks":"Use `\u003cpre\u003e` for multiple lines of code. Be sure to escape any angle brackets in the code for proper rendering.\n    images_placeholders: \u003e\nAdd classes to an `\u003cimg\u003e` element to easily style images in any project.\n"}},"hello":"Hello world"},"ja":{"hello":"Hello world"}};