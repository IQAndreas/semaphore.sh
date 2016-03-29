
## Flag Semaphore in Bash

[![YouTube: Flag Semaphore in Bash](http://img.youtube.com/vi/3V6CzhpyHyc/0.jpg)](http://www.youtube.com/watch?v=3V6CzhpyHyc "YouTube: Semaphore in Bash")  
_(click the video to play on YouTube)_

No outside dependencies, but requires Bash 4.0 or greater.

### Usage

The first argument is the string you want to spell out letter by letter, with support for numbers.

```
 $ ./semaphore.sh "Hello world.";
```

Alternatively, you can send specific commands for specific signals. The following commands are supported:

```
 $ ./semaphore.sh REST;
 $ ./semaphore.sh ERROR;
 $ ./semaphore.sh ACKNOWLEDGE;
 $ ./semaphore.sh CORRECT;
 $ ./semaphore.sh CANCEL;
```

### Future improvements

**ASCII Art** - If someone wants to create nicer ASCII art, send a pull request or just open an issue with a sample. The framework is there and as little as possible is hardcoded, making it easy to add any design you want.

**Quality Check** - I have never actually learned semaphore, everything in this library was created based on Wikipedia. I need someone proficient in flag semaphore to error-check the output, and make sure the usage is correct.

