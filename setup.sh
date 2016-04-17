# Remove old sylinks
rm /usr/bin/gcc
rm /usr/bin/g++

# Reset symbolic links to gcc5 and g++5
ln -s /usr/bin/gcc-5 /usr/bin/gcc
ln -s /usr/bin/g++-5 /usr/bin/g++

# Run cmake and make
cmake .
make

# Run tests
make test