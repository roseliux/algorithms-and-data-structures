# docker run -it --rm --name my-running-script -v "$PWD":/usr/src/app -w /usr/src/app my-ruby-app ruby hello.rb
# docker run -it --rm --name my-running-script1 -v /c/Users/rocela/github/algorithms_and_data_structures:/usr/src/app -w /usr/src/app my-ruby-app ruby hello.rb

3.times {puts 'hello...'}
puts 'world.'
