[alexggordon.com](http://alexggordon.com)
===============

This is my personal website. 

## About
===============
The site was built using [Sublime Text 3](http://www.sublimetext.com/3), on [Skeleton](http://getskeleton.com/) (an awesome, simple CSS framework by [Dave Gamache](http://davegamache.com/)). The icons are obtained from [ionicons](http://ionicons.com/) and the font is [Railway](http://www.google.com/fonts/specimen/Raleway).

It is deployed with [Mina](http://nadarei.co/mina/), and runs on [Unicorn](http://unicorn.bogomips.org/) and [Sinatra](http://www.sinatrarb.com/).

## Why use x? 
To help clarify the decisions behind a lot of the tools I use, I've started to explain "Why I used x?" with all my projects. 

I tend to explain the questionable ones, more so than the staples (i.e, it's a lot more common to wonder "why use Sinatra?" as opposed to "why use Nginx?"). 

#### Why use [Sinatra](http://www.sinatrarb.com/)?
I used [Sinatra](http://www.sinatrarb.com/) because I wanted to learn a Ruby DSL that was super simple and a lot more compact than Rails. Unfortunately, I found Sinatra to be a little more cumbersome than I'd like, and found a few bugs even in writing a small app like this website. 

In hindsight, given that this is a mostly static site, I'd probably use [Github Pages](https://pages.github.com/) if given a chance to redo it. 

#### Why use [Mina](http://nadarei.co/mina/)?
I've had a lot of experience with Capistrano (and the slowness of pure Ruby deploys), and I like not re-inventing the wheel. Mina's use of SSH and Bash Script generation fit perfectly with this  paradigm. As a side note Mina's cooperation with my [zero-downtime](https://github.com/alexggordon/alexggordon/blob/37854a07190ab3ae90a951ec3eb07647f77589db/config/unicorn.rb#L40) [deploys](https://github.com/alexggordon/alexggordon/blob/37854a07190ab3ae90a951ec3eb07647f77589db/config/deploy.rb#L56) was excellent. 

### Why use [Skeleton](http://getskeleton.com/)?
I think Skeleton works great as a tool that allows me to create websites with different visual feel (unlike something like bootstrap), but still takes care of a lot of the annoying things like a responsive design. In addition to this, it's small and light as a CSS library. 

#### Why use [ionicons](http://ionicons.com/)?
I wanted open source, license free SVGs. Unfortunately, [license issues](https://twitter.com/alexggordon/status/546724595865116672) are an actual problem sometimes. 


License
===============
The MIT License (MIT)

Copyright (c) 2015 Alex Gordon

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
