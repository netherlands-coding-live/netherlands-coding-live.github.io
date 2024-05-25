# NL_CL Website

This is the NL_CL (Netherlands Coding Live) community's website. Please feel free to contribute to this website if you have any links/videos/events/workshops to share with the community! 🎉 Below are some instructions for contribution and how the site works in general.

## Install

The site is build with [Hugo](https://gohugo.io/). An open-source static-site generator framework. You'll have to install `hugo` and `git` if you want to work on the site locally.

Follow the instructions here: [https://gohugo.io/installation/](https://gohugo.io/installation/)

*Windows user: You'll have to use [Powershell](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4)*

Check if the installation worked correctly by running: 

`hugo version` (the version should be v0.112.0 or later)

Now clone this repository to your computer: 

`git clone --recursive-submodules https://github.com/netherlands-coding-live/netherlands-coding-live.github.io.git`

To run the server locally and develop for the site:

`hugo server`

Then go to: `localhost:1313` to view the website (or the port that is printed in the terminal)

## Usage

Hugo builds the pages/posts from markdown (`.md`) files. The markdown syntax makes it very easy to add new pages without worrying to much about the actual layout.

The actual layout is described in the `/layout` folder with `.html` files. The html files are generalized and content of it gets replaced based on the content of the markdown files. This is done in the build/deploy stage. So the output is a static site with only html pages. You can find a markdown guide in `/events/markdown-guide.md`

### Event

You can add your upcoming event as a markdown file in the `/events` folder. Please use this format for the filename `yyyy-mm-dd-shortname.md`. You can use a previous event as example to see how everything is formatted.

## Contribute

1. Fork this repository (click `fork` in the top right)
2. Clone the repository to your computer `git clone https://github.com/<this-is-you>/<forked-repo>.git`
3. Branch the Fork `git checkout -b <name-your-branch>`
4. Add the things and changes everything you like to the site.
6. Add, commit and push your changes `git add .` `git commit -a` `git push origin <your-branch-name>`
7. Go to your forked repo in the browser and click `compare & pull request`, then `create pull request`

[All steps with examples and images](https://github.com/firstcontributions/first-contributions/blob/master/README.md)

## Code of Conduct

**Our Pledge**

In the interest of fostering an open and welcoming environment, we as contributors and maintainers pledge to making participation in our project and our community a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, sex characteristics, gender identity and expression, level of experience, education, socio-economic status, nationality, personal appearance, race, religion, or sexual identity and orientation.

[Read the full Code of Conduct](/CODE_OF_CONDUCT.md)
