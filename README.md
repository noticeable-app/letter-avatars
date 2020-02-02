# letter-avatars

![E0](https://letters.noticeable.io/E0.png) 
![N1](https://letters.noticeable.io/N1.png) 
![J2](https://letters.noticeable.io/J2.png) 
![03](https://letters.noticeable.io/O3.png) 
![Y4](https://letters.noticeable.io/Y4.png) 
![AA5](https://letters.noticeable.io/AA5.png)
![PP7](https://letters.noticeable.io/PP7.png) 
![ZZ11](https://letters.noticeable.io/ZZ11.png) 

Did you never wanted to serve letter avatars from a fast CDN to take advantage
of low network latency, efficient caching strategies and be technology independent?

This repository contains pre-generated PNG and SVG images for all single and two letters avatars,
including variants with 19 background colors. That's 25,688 avatar images ready to be served from edge nodes and cached efficiently.

## How to use

You can import any avatar image as follows:

```html
<img src="https://letters.noticeable.io/E0.png" />
<img src="https://letters.noticeable.io/E0.svg" />
```

Images must use `https://letters.noticeable.io/` as base URL. Each image is named using one or two uppercase letters followed by a number that ranges between 0 and 18 included. The number depicts one of the 19 background color variants.

### Generating default users avatar

We recommend generating a URL per user when an account is created and to save the generated URL next to other user data.

To create the user avatar URL you need to proceed in 3 steps:

1. Extract the single or 2 letters from the user display name, transform them to uppercase and append them to the base URL;
2. Hash the user display name or email to get a number, apply modulo 19 and append the value to the URL obtained in 1;
3. Append the image type as extension (.png or .svg supported).

Ideally, when a user updates his display name or email you should regenerates his default avatar URL.

### Rounded corners

Do you want rounded corners or a disk as a background image? let's use CSS:

```html
<img src="https://letters.noticeable.io/E0.svg" style="border-radius: 8px" />
<img src="https://letters.noticeable.io/E0.svg" style="border-radius: 50%" />
```
