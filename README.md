


# ActiveLdap::DynamicFinders

Dynamic finders for [ActiveLdap](https://github.com/activeldap/activeldap)


## Installation

Add this line to your application's Gemfile:

    gem 'active_ldap-dynamic_finders'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_ldap-dynamic_finders

## Usage

Add it to your ActiveLdap model:

```ruby
class User < ActiveLdap::Base

  include ActiveLdap::DynamicFinders # <- Add this line
  
  ...
end
```

Then you have `.find_by_*` and `.find_by_*_and_*` methods. _Replace * with any attribute available in your ActiveDirectory_

```ruby
User.find_by_cn('jim')
```
```ruby
User.find_by_cn_and_mail('jim', 'jim@example.com')
```

## Code Status
* [![Build Status](https://travis-ci.org/XORwell/activeldap-dynamic_finders.png)](https://travis-ci.org/XORwell/activeldap-dynamic_finders)
* [![Code Climate](https://codeclimate.com/repos/52840661c7f3a31afb022567/badges/ef5745b61ee31ef9a4dc/gpa.png)](https://codeclimate.com/repos/52840661c7f3a31afb022567/feed)
* [![Dependency Status](https://gemnasium.com/XORwell/activeldap-dynamic_finders.png)](https://gemnasium.com/XORwell/activeldap-dynamic_finders)

## License
ActiveLdap::DynamicFinders is released under the [MIT License](http://opensource.org/licenses/MIT).

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

## Thanks

This list may not be correct. If you notice mistakes of this
list, please point out.

* Kouhei Sutou: maintaining ActiveLdap
