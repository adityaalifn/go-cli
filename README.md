# GO-CLI
SOFTWARE ENGINEERING ACADEMY COMPFEST X - GO-JEK SECOND STAGE FINAL ASSIGNMENT

## Getting Started
### Prerequisites

```
Ruby Programming Language
RSpec
```

### Installing
Install Ruby

```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB --ruby
```

Install RSpec Gem

```
gem install rspec
```

## Running the tests

```
cd spec
rspec <filename.rb>
```

## Running the Program
### By running go-cli without any parameters
This will generate a 20 * 20 map, put 5 drivers at random coordinates, and put your user at a random coordinate.
```
ruby main.rb
```

### By running go-cli and passing three parameters
The first parameter (let say n) would be the size of the map (n * n), the second and the third parameter (let say x and y) will be the coordinate of your user (x, y). And generate 5 drivers and put them randomly on the map.
```
ruby main.rb <map size> <user x coordinate> <user y coordinate>
Example: ruby main.rb 200 100 100
```

### By passing a filename as go-cli parameter
This will generate a map with size as specified in the file, put your user in the coordinate as specified in the file, and put the number of drivers and their positions as specified in the file as well. You are free to decide the format of data in the file, but you have to be able to argue your choice of design of this data format.
```
ruby main.rb <filename.txt>
Example: ruby main.rb command.txt
```

#### Command Format
**The format should match below, otherwise the app can not parse the menu**
```
create_map <map_size>
user_coordinate <user x coordinate> <user y coordinate>
driver <name> <driver x coordinate> <driver y coordinate>
.
.
.
driver <name> <driver x coordinate> <driver y coordinate
```

File example can be found in [command.txt](command.txt).

## Assumption and Design Decision

### Design Decision
* CLEAN CODE? (maybe) read the code like read a children's storybook
* Understandable variable naming
* As much as possible I use TDD but still confused
* Implement SOLID Principle (not sure :sweat_smile:)
* Implement DRY Principle (not sure :sweat_smile:)
* Using Singleton Design Pattern to the Class that only instantiate once
* Can handle user unexpected input
* Follow [Ruby Style Guide](https://github.com/github/rubocop-github/blob/master/STYLEGUIDE.md)

### Assumption
* More than two user can be in the same coordinate and only one Driver shown in Map 
* User and Driver can be having same coordinate and only the User shown in Map
* Map class was rename into Maps to avoid same name as Ruby built-in function
* Random driver name was randomly taken from name list
* If there is more than one Driver that nearest to user, the last one compared Driver was taken
* X coordinate represent horizontal axis
* Y coordinate represent vertical axis
* History will be saved as long as User not delete the "order_history.yml" file
* After User confirming the order, User coordinate is changing to destination
* After User confirming the order, Driver was randomly placed in Map
* YAML format file was used to store order history because it can easily load and save the history
* All of the input must be same format as requested. Otherwise it will display a informational message  


## Authors
**Aditya Alif Nugraha** - *Exclusively for COMPFEST x GO-JEK* - [Aditya Alif Nugraha](https://adityaalifn.github.io)


## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
