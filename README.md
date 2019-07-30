# lists-html

## Overview
This project is for the maintainence of stylesheets and templates for the Lubuntu mailing list pages located on the [Ubuntu Mailing Lists](https://lists.ubuntu.com) page.  HTML templates are located in the "templates" folder and are used to generate HTML similar to what Mailman generates, by replacing template tags with placeholder HTML taken from the actual site.  These translations are located in "templates/translations".

## Requirements
* Node 12.16.0 or newer ([NVM](https://github.com/nvm-sh/nvm) suggested)
* a web browser

## Setup
This is how you can use this repository to make updates to the styles or templates:

 ### Checkout
 Clone the git repo:
```bash
git clone https://github.com/lubuntu-team/lists-html.git
```

 ### Install Dependencies
 Install the serve npm module to statically serve your local working directory:
 ```bash
 npm i -g serve
 ```

 ### Run
 Execute the script to generate HTML from the mailman templates:
 ```bash
./fill_template.sh
 ```
 Start serving the current directory (execute inside lubuntu-mailman-style project):
 ```bash
 serve .
 ```
 Now, navigate to [localhost](http://localhost:5000) and open one of the html files to preview it--any changes to the underlying files will update without having to restart "serve".

 ## Updating the Templates and Translations
 To update templates used by this repository, simply navigate to the following URLs, view page source, and save the page source to the templates folder.  Be sure to check for new, unmapped tags and add them to "templates/translations".

 To update translations, simply add or edit translation lines.  They are in "templates/translations" in the following format:
 ```text
 <MM-List-Name>////Lubuntu-users
 ```
As you can see, the first part of the line is the placeholder tag that will be replaced, then there is a separator "////", followed by the text to replace the tag with.  If newline characters are required in the replacement text, please use the "\n" escape sequence, making sure to put the entire replacement on the same line.
