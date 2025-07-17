# NL_CL Website

This is the NL_CL (Netherlands Coding Live) community's website. Please feel free to contribute to this website if you have any links/videos/events/workshops to share with the community! 🎉 Below are some instructions for contribution and how the site works in general.

- [Install](#install)
- [Usage](#usage)
	- [Add Event](#add-event)
	- [Embed](#embed)
	- [Change Style](#change-style)
	- [Change Layout](#change-layout)
	- [Add Gallery](#add-gallery)
- [Deploy to Github Pages](#deploy-to-github-pages)
- [Contribute](#contribute)
- [Code of Conduct](#code-of-conduct)

## Install

The site is build with [Hugo](https://gohugo.io/). An open-source static-site generator framework. You'll have to install `hugo` and `git` if you want to work on the site locally.

Follow the instructions here: [https://gohugo.io/installation/](https://gohugo.io/installation/)

*Windows user: You'll have to use [Powershell](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4)*

Check if the installation worked correctly by running: 

`hugo version` (the version should be v0.112.0 or later)

Now clone this repository to your computer: 

`git clone --recursive-submodules https://github.com/netherlands-coding-live/netherlands-coding-live.github.io.git`

To run the server locally and develop for the site:

`hugo server -F -D`

Then go to: `localhost:1313` to view the website (or the port that is printed in the terminal)

When you are happy with the results you can also built and deploy the site to the `/public` folder:

`hugo --cleanDestinationDir`

## Usage

Hugo builds the pages/posts from markdown (`.md`) files. The markdown syntax makes it very easy to add new pages without worrying to much about the actual layout.

The actual layout is described in the `/layout` folder with `.html` files. The html files are generalized and parts of it get replaced based on the content of the markdown files. This is done in the build/deploy stage. So the output is a static site with only html pages. You can find a markdown guide in `http://localhost:1313/events/markdown-guide` or on [this github gist](https://gist.github.com/cuonggt/9b7d08a597b167299f0d#file-markdown_guide-md).

### Add Event

You can add your upcoming event as a markdown file in the `/events` folder. Create a new file with the name: `yyyy-mm-dd-shortname.md`. You can use a previous event as an example to see how everything is formatted. Please refer to the `/events/markdown-guide.md` to see what you can do with markdown. In the beginning of the file type the following (please note the `'`, these are important!):

```markdown
+++
title 		= 'Your event title' (keep it short for best view)'
description = '@location. A short summary of your event for on the main page.'

location 	= '[Name of venue, addres, city, NL](https://www.openstreetmap.org/maps/link/here)'
doors 	 	= yyyy-mm-dd:hh:mm:ss+01:00 (optional, set the date and door opening time, add the timezone with +01:00)
start 	 	= yyyy-mm-dd:hh:mm:ss+01:00 (set the date and start time, add the timezone with +01:00)
end 	 	= yyyy-mm-dd:hh:mm:ss+01:00 (set the date and end time, add the timezone with +01:00)
price 	 	= '€?' (optional, set a price for the event)

links = """
### [>> Go to Eventpage](https://link.to.eventpage)
"""

draft = false (set this to true while developing and if you don't want to publish yet)
+++
```

Now you can add the details for your event in the markdown file following this template:

```markdown
## About

Some more details like what is the event about and who are in the line-up

## More headers

More text that you want to add

{{< optional embeddings like youtube vids (read below) >}}
```

### Embed

If you like to embed some item from another webpage, for example a youtube video, you can use the hugo `shortcode`s. The shortcode for a youtube video is: `{{< youtube video-ID >}}`. You can put this in the markdown file and it will generate the necessary html code (using `<iframe>` etc). The markdown will look like this:

```markdown
# The ICLC 2023 Aftermovie

This is the aftermovie from the International Conference on Live Coding 2023 in Utrecht.

{{< youtube IDehg9Wbrws >}}
```

You can find other shortcodes such as `gist`, `vimeo`, `twitter`, `instagram` or read on how to make your own shortcodes in the [Hugo Documentation](https://gohugo.io/content-management/shortcodes/).

### Change Style

You can add additional styling to the `static/css/customstyle.css` file. If you want to use a style that is different between light and dark mode you can put it in the `.darkmode{ }` and `.lightmode{ }` class. If you want a style that can be refered to in multiple places use a variable name `--your-var-name:` in `:root{ }` and refer to the style in the correct places with `var(--your-var-name)`

### Change Layout

You can change the layout by adjust the files in `/layouts`. The `/_default/baseof.html` is the html every page is based on. The `/index.html` is the layout for the main page when you enter the site. The `/partials/footer.html` is the layout for the footer. If you want to adjust a layout of a page that is not there, then you can find it in the `/themes/<theme-name>/layouts`. 

It is good practice to copy the file from the theme to the other `/layouts` folder and then adjust it there. This way your new layout wont get overwritten by an update to the theme.

## Add Gallery

If you like to add some photos to the Gallery you can do the following:

1. Create a folder in `/content/photos` and name the folder appropriately (for example the event name where the pictures were taken).
2. Add all the pictures you like to include. **Please reduce the filesize as much as possible to < 500kB**! (eg. 1920x1080 pixels, JPEG, quality=80 is usually okay)
3. Add an `index.md` to the folder (you can copy one from the other folders) and add some info for the page. Below is the template:

```markdown
+++
image = "name-of-image-for-display-on-homepage.jpg"
date = "yyyy-mm-dd"
title = "Name of the Event"
type = "gallery"
+++

Date: day Month year

Location: Venue name, City

Photos by: [Photographer](https://photographer.website.nl/)

<!-- More pictures on []() -->
<!-- Optional in case you host more pictures on for example Flickr or some other place -->

## About

Some text about the event
```

4. You don't have to add pictures to the index.md, they will automatically be rendered if they are in the correct folder.

## Deploy to Github Pages

A `workflow` for automatic building and deployment to github pages can be found [in the Hugo documentation](https://gohugo.io/hosting-and-deployment/hosting-on-github/).

Add the content from the documentation to a new file called `.github/workflows/hugo.yaml` (this is currently already done for this website)

If you can't push the new workflow to github you might need to have the correct credentials and scope. Log in through the terminal with `gh auth login --scopes workflow` (if you don't have Github CLI, first run `brew install gh`)

## Contribute

1. Fork this repository (click `fork` in the top right)
2. Clone the repository to your computer `git clone https://github.com/this-is-you/forked-repo.git`
3. Branch the Fork `git checkout -b new-branch-name`
4. Add the things and changes you like to the site.
6. Add, commit and push your changes `git add .`, `git commit -m` (write a commit message), `git push origin new-branch-name`
7. Go to your forked repo in the browser and click `compare & pull request`, then `create pull request`

[All steps with examples and images](https://github.com/firstcontributions/first-contributions/blob/master/README.md)

## Code of Conduct

**Our Pledge**

In the interest of fostering an open and welcoming environment, we as contributors and maintainers pledge to making participation in our project and our community a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, sex characteristics, gender identity and expression, level of experience, education, socio-economic status, nationality, personal appearance, race, religion, or sexual identity and orientation.

[Read the full Code of Conduct](/CODE_OF_CONDUCT.md)
