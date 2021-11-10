# ror_blog_m5-w1

![Microverse](https://img.shields.io/badge/Microverse-blueviolet)

Ror blog is a practical exercise where I have to get familiar with RoR and its basic features.
![blog all user posts](./images/blog_user_all_posts.png)

The app is simple blog where users can create an account and create posts, access to other people posts, and
like and comment in them.

=======

## Built With 

- Ruby on Rails
- Rubocop

=======

### Prerequisites

- To run this project you must to have ruby installed in your machine. If you don't have it
follow the instructions [here](https://www.ruby-lang.org/en/documentation/installation/)
- Postgres


## Getting Started

If you want a copy of this file go to the github repository and download it from there

- [`git clone https://github.com/Metsanpeitto/ ror_blog_m5-w1`](https://github.com/Metsanpeitto/ ror_blog_m5-w1)


### Setup

* Clone the repo
    ``` bash
    git clone  https://github.com/Metsanpeitto/ror_blog_m5-w1.git
    ```
  
* Cd to the dir 
    ``` bash
    cd ror_blog_m5-w1
    ```
* Instal yarn dependency
    ``` bash
      yarn
    ```
* Install gem dependency
    ``` bash
      bundle
    ```
* Create new postgres user, create new db and update the user to superuser
    ``` bash
      sudo -su postgres
      psql
      create user microverse_user with password 'postgres';
      ALTER USER microverse_user WITH SUPERUSER;
      create database ror_blog_m5_w1_development owner microverse_user;
    ```
* Update the db
  ``` bash
    rails db:reset
  ```

* Becuause the email permission will be trouble, log into gmail with
    ``` bash
      email: jarriror@gmail.com
      password: rubyonrails
    ```
* When asks for an email to confirm use
  ``` bash
    abraham@waldenberginc.com
  ```

* You can now logout and start the application
   ``` bas
    rails s
  ```
* You can see the working app at
  http://localhost:3000


### Verify rubocop

```cmd
- rubocop -A
```

### Install Stylelint

```cmd
npm install --save-dev stylelint@13.x stylelint-scss@3.x stylelint-config-standard@21.x stylelint-csstree-validator@1.x
```

### Auto fix Stylelint

```cmd
npx stylelint "**/*.{css,scss}" --fix
```

### Instruction for non technical persons

If you are non a technical person you can download the zip file.

- To do that you have to go to the green button that says 'Code' and then press on it.
- Choose the option 'Download Zip' and wait until it download.
- Then you need to decompress it.
- You will need to have Zip compress file software installed in your computer. If you don't have it you can download it from here
  [`https://www.7-zip.org/download.html`](https://www.7-zip.org/download.html)
- Do double click on the Capstone-1.zip and choose a folder where to place all teh decompressed files.
- Once you are done decompressing, you can open the created folder.
- In it you can double click on the index.html file and choose a browser to open it (For example google Chrome Browser).
- Now you should be able to see the project.
- Remember to use the mouse to navigate through the website. Also you can use the keys 'arrow up' and 'arrow down' of your keyboard
  to scroll up and down.

=======

## Author

👤 **Abraham Rodriguez**

- GitHub: [@metsanpeitto](https://github.com/Metsanpeitto)
- Twitter: [@metsanpeitto](https://twitter.com/home)
- LinkedIn: [Abraham Rodriguez](https://www.linkedin.com/in/abraham-rodriguez-3283a319a/)
- Portfolio: [Waldenberg](https://portfolio.waldenberginc.com)

👤 Simon Grchevski

- GitHub: [GitHub](https://github.com/SimonGrchevski)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/simon-grchevski-682935209/)
- Twitter: [Twitter](https://twitter.com/grchevski)

=======

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

=======

## Show your support

Give a ⭐️ if you like this project!

=======


## Acknowledgments

- Microverse for giving me this chance
- The amazing code reviewers for making me improve every day :thumbsup:

=======

[![License: CC BY-NC 4.0](https://licensebuttons.net/l/by-nc/4.0/80x15.png)](https://creativecommons.org/licenses/by-nc/4.0/)
[![License: CC0-1.0](https://licensebuttons.net/l/zero/1.0/80x15.png)](http://creativecommons.org/publicdomain/zero/1.0/)


