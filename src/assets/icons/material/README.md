# Material Icons

These unmodified 24px filled SVG icons come from Google's [Material Design Icons](https://github.com/google/material-design-icons) and are licensed under the Apache License 2.0 (see [LICENSE](./LICENSE)).

- `arrow-back.svg`: [`arrow_back`](https://github.com/google/material-design-icons/blob/master/src/navigation/arrow_back/materialicons/24px.svg)
- `arrow-forward.svg`: [`arrow_forward`](https://github.com/google/material-design-icons/blob/master/src/navigation/arrow_forward/materialicons/24px.svg)

`ImageCarousel.astro` imports these as inline SVG components and sets `fill="currentColor"`, so they inherit the button color without an icon font or external runtime request.
