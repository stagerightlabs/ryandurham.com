defmodule Library.Seeds do

  alias Library.Author
  alias Library.Repo

  import Ecto.Query, only: [from: 2]

  def run do
    seed_authors()
  end

  @author_data [
    %{name: "Abraham Verghese", sortable_name: "Verghese, Abraham", slug: "abraham-verghese"},
    %{name: "Agatha Christie", sortable_name: "Christie, Agatha", slug: "agatha-christie"},
    %{name: "Alan Moore", sortable_name: "Moore Alan", slug: "alan-moore"},
    %{name: "Alan Schom", sortable_name: "Schom, Alan", slug: "alan-schom"},
    %{name: "Alex Stone", sortable_name: "Stone, Alex", slug: "alex-stone"},
    %{name: "Alice Sebold", sortable_name: "Sebold, Alice", slug: "alice-sebold"},
    %{name: "Andreas M. Antonopoulos", sortable_name: "Antonopoulos, Andreas M.", slug: "andreas-m-antonopoulos"},
    %{name: "Andrew Hodges", sortable_name: "Hodges, Andrew", slug: "andrew-hodges"},
    %{name: "Andrew Mayne", sortable_name: "Mayne, Andrew", slug: "andrew-mayne"},
    %{name: "Andy Weir", sortable_name: "Weir, Andy", slug: "andy-weir"},
    %{name: "Anthony Bourdain", sortable_name: "Bourdain, Anthony", slug: "anthony-bourdain"},
    %{name: "Antony Sher", sortable_name: "Sher, Antony", slug: "antony-sher"},
    %{name: "Armin A. Brott", sortable_name: "Brott, Armin A.", slug: "armin-a-brott"},
    %{name: "Arthur Conan Doyle", sortable_name: "Doyle, Arthur Conan", slug: "arthur-conan-doyle"},
    %{name: "Arthur Golden", sortable_name: "Golden, Aurthur", slug: "arthur-golden"},
    %{name: "Ashlee Vance", sortable_name: "Vance, Ashlee", slug: "ashlee-vance"},
    %{name: "Barack Obama", sortable_name: "Obama, Barack", slug: "barack-obama"},
    %{name: "Barry Pollard", sortable_name: "Pollard, Barry", slug: "barry-pollard"},
    %{name: "Barry Schwartz", sortable_name: "Schwartz, Barry", slug: "barry-schwartz"},
    %{name: "Bernard Cornwell", sortable_name: "Cornwell, Bernard", slug: "bernard-cornwell"},
    %{name: "Bill Browder", sortable_name: "Browder, Bill", slug: "bill-browder"},
    %{name: "Bill Bryson", sortable_name: "Bryson, Bill", slug: "bill-bryson"},
    %{name: "Brad Stone", sortable_name: "Stone, Brad", slug: "brad-stone"},
    %{name: "Brad Warner", sortable_name: "Warner, Brad", slug: "brad-warner"},
    %{name: "Brent Walth", sortable_name: "Walth, Brent", slug: "brent-walth"},
    %{name: "Bruce Campbell", sortable_name: "Campbell, Bruce", slug: "bruce-campbell"},
    %{name: "Bruce Tate", sortable_name: "Tate, Bruce", slug: "bruce-tate"},
    %{name: "C.S. Lewis", sortable_name: "Lewis, C.S.", slug: "cs-lewis"},
    %{name: "Cal Newport", sortable_name: "Newport, Cal", slug: "cal-newport"},
    %{name: "Caleb Carr", sortable_name: "Carr, Caleb", slug: "caleb-carr"},
    %{name: "Caleb Doxsey", sortable_name: "Doxsey, Caleb", slug: "caleb-doxsey"},
    %{name: "Candice Millard", sortable_name: "Millard, Candice", slug: "candice-millard"},
    %{name: "Carl Sagan", sortable_name: "Sagan, Carl", slug: "carl-sagan"},
    %{name: "Carol Nichols", sortable_name: "Nichols, Carol", slug: "carol-nichols"},
    %{name: "Charles C. Mann", sortable_name: "Mann, Charles C.", slug: "charles-c-mann"},
    %{name: "Charles Petzold", sortable_name: "Petzold, Charles", slug: "charles-petzold"},
    %{name: "Chris McCord", sortable_name: "McCord, Chris", slug: "chris-mccord"},
    %{name: "Christian Grobmeier", sortable_name: "Grobmeier, Christian", slug: "christian-grobmeier"},
    %{name: "Christopher Hitchens", sortable_name: "Hitchens, Christopher", slug: "christopher-hitchens"},
    %{name: "Chuck Palahniuk", sortable_name: "Palahniuk, Chuck", slug: "chuck-palahniuk"},
    %{name: "Claire Willett", sortable_name: "Willett, Claire", slug: "claire-willett"},
    %{name: "Cooper Moo", sortable_name: "Moo, Cooper", slug: "cooper-moo"},
    %{name: "Cormac McCarthy", sortable_name: "McCarthy, Cormac", slug: "cormac-mccarthy"},
    %{name: "Cory Doctorow", sortable_name: "Doctorow, Cory", slug: "cory-doctorow"},
    %{name: "Craig Ferguson", sortable_name: "Ferguson, Craig", slug: "craig-ferguson"},
    %{name: "Dan Nemeth", sortable_name: "Nemeth, Dan", slug: "dan-nemeth"},
    %{name: "Dan Simmons", sortable_name: "Simmons, Dan", slug: "dan-simmons"},
    %{name: "Daniel J. Barrett", sortable_name: "Barrett, Daniel J.", slug: "daniel-j-barrett"},
    %{name: "Daniel Suarez", sortable_name: "Suarez, Daniel", slug: "daniel-suarez"},
    %{name: "Dave Gibbons", sortable_name: "Gibbons, Dave", slug: "dave-gibbons"},
    %{name: "Dave Isay", sortable_name: "Isay, Dave", slug: "dave-isay"},
    %{name: "David Grann", sortable_name: "Grann, David", slug: "david-grann"},
    %{name: "David Herbert Donald", sortable_name: "Donald, David Herbert", slug: "david-herbert-donald"},
    %{name: "David Mitchell", sortable_name: "Mitchell, David", slug: "david-mitchell"},
    %{name: "David Weber", sortable_name: "Weber, David", slug: "david-weber"},
    %{name: "Denise Kiernam", sortable_name: "Kiernam, Denise", slug: "denise-kiernam"},
    %{name: "Dick DeBartolo", sortable_name: "DeBartolo, Dick", slug: "dick-debartolo"},
    %{name: "Douglas Adams", sortable_name: "Adams, Douglas", slug: "douglas-adams"},
    %{name: "Edwin Lefèvre", sortable_name: "Lefèvre, Edwin", slug: "edwin-lefevre"},
    %{name: "Ellen Feldman", sortable_name: "Feldman, Ellen", slug: "ellen-feldman"},
    %{name: "Eric Redmond", sortable_name: "Redmond, Eric", slug: "eric-redmond"},
    %{name: "Erik Bear", sortable_name: "Bear, Erik", slug: "erik-bear"},
    %{name: "Erik Larson", sortable_name: "Larson, Erik", slug: "erik-larson"},
    %{name: "Ernest Cline", sortable_name: "Cline, Ernest", slug: "ernest-cline"},
    %{name: "Ernest Hemingway", sortable_name: "Hemingway, Ernest", slug: "ernest-hemingway"},
    %{name: "Ernest Kurtz", sortable_name: "Kurtz, Ernest", slug: "ernest-kurtz"},
    %{name: "Ethan Mordden", sortable_name: "Mordden, Ethan", slug: "ethan-mordden"},
    %{name: "Eugene E. Snyder", sortable_name: "Snyder, Eugene E.", slug: "eugene-e-snyder"},
    %{name: "Evan Hughes", sortable_name: "Hughes, Evan", slug: "evan-hughes"},
    %{name: "Eve Curie", sortable_name: "Curie, Eve", slug: "eve-curie"},
    %{name: "Frank Herbert", sortable_name: "Herbert, Frank", slug: "frank-herbert"},
    %{name: "Frank McCourt", sortable_name: "McCourt, Frank", slug: "frank-mccourt"},
    %{name: "Frederick P. Brooks", sortable_name: "Brooks, Frederick P.", slug: "frederick-p-brooks"},
    %{name: "Gabrielle Hamilton", sortable_name: "Hamilton, Gabrielle", slug: "gabrielle-hamilton"},
    %{name: "Garrett Hardin", sortable_name: "Hardin, Garrett", slug: "garrett-hardin"},
    %{name: "Geoffrey Lessel", sortable_name: "Lessel, Geoffrey", slug: "geoffrey-lessel"},
    %{name: "George Orwell", sortable_name: "Orwell, George", slug: "george-orwell"},
    %{name: "George R.R. Martin", sortable_name: "Martin, George R.R.", slug: "george-rr-martin"},
    %{name: "George S. Clason", sortable_name: "Clason, George S.", slug: "george-s-clason"},
    %{name: "Greg Bear", sortable_name: "Bear, Greg", slug: "greg-bear"},
    %{name: "Hans Rosling", sortable_name: "Rosling, Hans", slug: "hans-rosling"},
    %{name: "Haruki Murakami", sortable_name: "Murakami, Haruki", slug: "haruki-murakami"},
    %{name: "Helen Epstein", sortable_name: "Epstein, Helen", slug: "helen-epstein"},
    %{name: "Huggy Rao", sortable_name: "Rao, Huggy", slug: "huggy-rao"},
    %{name: "J.D. Robb", sortable_name: "Robb, J.D.", slug: "j-d-robb"},
    %{name: "J. David Eisenberg", sortable_name: "Eisenberg, David J.", slug: "j-david-eisenberg"},
    %{name: "J.D. Vance", sortable_name: "Vance, J.D.", slug: "jd-vance"},
    %{name: "J.K. Rowling", sortable_name: "Rowling, J.K.", slug: "jk-rowling"},
    %{name: "Jack Herer", sortable_name: "Herer, Jack", slug: "jack-herer"},
    %{name: "Jennifer Ash", sortable_name: "Ash, Jennifer", slug: "jennifer-ash"},
    %{name: "Jennifer Davis", sortable_name: "Davis, Jennifer", slug: "jennifer-davis"},
    %{name: "Jennifer Egan", sortable_name: "Egan, Jennifer", slug: "jennifer-egan"},
    %{name: "Jessica Lahey", sortable_name: "Lahey, Jessica", slug: "jessica-lahey"},
    %{name: "Jim. R. Wilson", sortable_name: "R. Wilson, Jim.", slug: "jim-r-wilson"},
    %{name: "Joanne Nordling", sortable_name: "Nordling, Joanne", slug: "joanne-nordling"},
    %{name: "Joel Fuhrman", sortable_name: "Fuhrman, Joel", slug: "joel-fuhrman"},
    %{name: "John Adams", sortable_name: "Adams, John", slug: "john-adams"},
    %{name: "John D. Snider", sortable_name: "D. Snider, John", slug: "john-d-snider"},
    %{name: "John Irving", sortable_name: "Irving, John", slug: "john-irving"},
    %{name: "John Kennedy Toole", sortable_name: "Toole, John Kennedy", slug: "john-kennedy-toole"},
    %{name: "John Perkins", sortable_name: "Perkins, John", slug: "john-perkins"},
    %{name: "John Trombold", sortable_name: "Trombold, John", slug: "john-trombold"},
    %{name: "John Updike", sortable_name: "Updike, John", slug: "john-updike"},
    %{name: "Jon Gertner", sortable_name: "Gertner, Jon", slug: "jon-gertner"},
    %{name: "Jon Kabat-Zinn", sortable_name: "Kabat-Zinn, Jon", slug: "jon-kabat-zinn"},
    %{name: "Jonah Lehrer", sortable_name: "Lehrer, Jonah", slug: "jonah-lehrer"},
    %{name: "Jonathan Haidt", sortable_name: "Haidt, Jonathan", slug: "jonathan-haidt"},
    %{name: "José Valim", sortable_name: "Valim, José", slug: "jose-valim"},
    %{name: "Joseph Brassey", sortable_name: "Brassey, Joseph", slug: "joseph-brassey"},
    %{name: "Joseph D'Agnese", sortable_name: "D'Agnese, Joseph", slug: "joseph-dagnese"},
    %{name: "Katherine Daniels", sortable_name: "Daniels, Katherine", slug: "katherine-daniels"},
    %{name: "Katherine Ketcham", sortable_name: "Ketcham, Katherine", slug: "katherine-ketcham"},
    %{name: "Kazuo Ishiguro", sortable_name: "Ishiguro, Kazuo", slug: "kazuo-ishiguro"},
    %{name: "Ken Follet", sortable_name: "Follet, Ken", slug: "ken-follet"},
    %{name: "Kevin Hoffman", sortable_name: "Hoffman, Kevin", slug: "kevin-hoffman"},
    %{name: "Kevin Mitnick", sortable_name: "Mitnick, Kevin", slug: "kevin-mitnick"},
    %{name: "Kevin Sampsell", sortable_name: "Sampsell, Kevin", slug: "kevin-sampsell"},
    %{name: "Laura Hillenbrand", sortable_name: "Hillenbrand, Laura", slug: "laura-hillenbrand"},
    %{name: "Lawrence Lessig", sortable_name: "Lessig, Lawrence", slug: "lawrence-lessig"},
    %{name: "Lawrence Wright", sortable_name: "Wright, Lawrence", slug: "lawrence-wright"},
    %{name: "Leo Hsu", sortable_name: "Hsu, Leo", slug: "leo-hsu"},
    %{name: "Lisa A. Phillips", sortable_name: "Phillips, Lisa A.", slug: "lisa-a-phillips"},
    %{name: "Louis De Bernieres", sortable_name: "De Bernieres, Louis", slug: "louis-de-bernieres"},
    %{name: "Luc Perkins", sortable_name: "Perkins, Luc", slug: "luc-perkins"},
    %{name: "M.T. Anderson", sortable_name: "Anderson, M.T.", slug: "mt-anderson"},
    %{name: "Malcolm Gladwell", sortable_name: "Gladwell, Malcolm", slug: "malcolm-gladwell"},
    %{name: "Marcus Aurelius", sortable_name: "Aurelius, Marcus", slug: "marcus-aurelius"},
    %{name: "Margaret Cheney", sortable_name: "Cheney, Margaret", slug: "margaret-cheney"},
    %{name: "Margot Lee Shetterly", sortable_name: "Lee Shetterly, Margot", slug: "margot-lee-shetterly"},
    %{name: "Maria Konnikova", sortable_name: "Konnikova, Maria", slug: "maria-konnikova"},
    %{name: "Mark Bittman", sortable_name: "Bittman, Mark", slug: "mark-bittman"},
    %{name: "Mark Frost", sortable_name: "Frost, Mark", slug: "mark-frost"},
    %{name: "Mark Teppo", sortable_name: "Teppo, Mark", slug: "mark-teppo"},
    %{name: "Mark Twain", sortable_name: "Twain, Mark", slug: "mark-twain"},
    %{name: "Marquis James", sortable_name: "James, Marquis", slug: "marquis-james"},
    %{name: "Masaji Ishikawa", sortable_name: "Ishikawa, Masaji", slug: "masaji-ishikawa"},
    %{name: "Matt Ruff", sortable_name: "Ruff, Matt", slug: "matt-ruff"},
    %{name: "Max Brooks", sortable_name: "Brooks, Max", slug: "max-brooks"},
    %{name: "Meg Meeker", sortable_name: "Meeker, Meg", slug: "meg-meeker"},
    %{name: "Michael Crichton", sortable_name: "Crichton, Michael", slug: "michael-crichton"},
    %{name: "Michael Pollan", sortable_name: "Pollan, Michael", slug: "michael-pollan"},
    %{name: "Mike Shanahan", sortable_name: "Shanahan, Mike", slug: "mike-shanahan"},
    %{name: "Myla Kabat-Zinn", sortable_name: "Kabat-Zinn, Myla", slug: "myla-kabat-zinn"},
    %{name: "Neal Stephenson", sortable_name: "Stephenson, Neal", slug: "neal-stephenson"},
    %{name: "Neil Degrasse Tyson", sortable_name: "Tyson, Neil Degrasse", slug: "neil-degrasse-tyson"},
    %{name: "Neil Gaiman", sortable_name: "Gaiman, Neil", slug: "neil-gaiman"},
    %{name: "Nicole Galland", sortable_name: "Galland, Nicole", slug: "nicole-galland"},
    %{name: "Noel Kingsbury", sortable_name: "Kingsbury, Noel", slug: "noel-kingsbury"},
    %{name: "Oliver Sacks", sortable_name: "Sacks, Oliver", slug: "oliver-sacks"},
    %{name: "Paul Johnson", sortable_name: "Johnson, Paul", slug: "paul-johnson"},
    %{name: "Paul Redmond", sortable_name: "Redmond, Paul", slug: "paul-redmond"},
    %{name: "Paul Rogat Loeb", sortable_name: "Rogat, Loeb Paul", slug: "paul-rogat-loeb"},
    %{name: "Penn Jillette", sortable_name: "Jillette, Penn", slug: "penn-jillette"},
    %{name: "Peter F. Hamilton", sortable_name: "Hamilton, Peter F.", slug: "peter-f-hamilton"},
    %{name: "Philip Roth", sortable_name: "Roth, Philip", slug: "philip-roth"},
    %{name: "Phillip K. Dick", sortable_name: "Dick, Phillip K.", slug: "phillip-k-dick"},
    %{name: "Phillip Pullman", sortable_name: "Pullman, Phillip", slug: "phillip-pullman"},
    %{name: "Piers Anthony", sortable_name: "Anthony, Piers", slug: "piers-anthony"},
    %{name: "Ray Monk", sortable_name: "Monk, Ray", slug: "ray-monk"},
    %{name: "Rebecca Solnit", sortable_name: "Solnit, Rebecca", slug: "rebecca-solnit"},
    %{name: "Regina Obe", sortable_name: "Obe, Regina", slug: "regina-obe"},
    %{name: "Richard K. Morgan", sortable_name: "Morgan, Richard K.", slug: "richard-k-morgan"},
    %{name: "Robert Heinlein", sortable_name: "Heinlein, Robert", slug: "robert-heinlein"},
    %{name: "Robert I. Sutton", sortable_name: "Sutton, Robert I.", slug: "robert-i-sutton"},
    %{name: "Robert Kiyosaki", sortable_name: "Kiyosaki, Robert", slug: "robert-kiyosaki"},
    %{name: "Roger J. Davies", sortable_name: "Davies, Roger J.", slug: "roger-j-davies"},
    %{name: "Ryan Holiday", sortable_name: "Holiday, Ryan", slug: "ryan-holiday"},
    %{name: "Sam Harris", sortable_name: "Harris, Sam", slug: "sam-harris"},
    %{name: "Sam Quinones", sortable_name: "Quinones, Sam", slug: "sam-quinones"},
    %{name: "Sandi Metz", sortable_name: "Metz, Sandi", slug: "sandi-metz"},
    %{name: "Sara Gruen", sortable_name: "Gruen, Sara", slug: "sara-gruen"},
    %{name: "Saša Jurić", sortable_name: "Jurić, Saša", slug: "sasa-juric"},
    %{name: "Simon St. Laurent", sortable_name: "St. Laurent, Simon", slug: "simon-st-laurent"},
    %{name: "Stephen E. Ambrose", sortable_name: "Ambrose, Stephen E.", slug: "stephen-e-ambrose"},
    %{name: "Stephen Hawking", sortable_name: "Hawking, Stephen", slug: "stephen-hawking"},
    %{name: "Stephen Johnson", sortable_name: "Johnson, Stephen", slug: "stephen-johnson"},
    %{name: "Stephen King", sortable_name: "King, Stephen", slug: "stephen-king"},
    %{name: "Steve Klabnik", sortable_name: "Klabnik, Steve", slug: "steve-klabnik"},
    %{name: "Steven Pinker", sortable_name: "Pinker, Steven", slug: "steven-pinker"},
    %{name: "Stieg Larson", sortable_name: "Larson, Stieg", slug: "stieg-larson"},
    %{name: "Susan Cain", sortable_name: "Cain, Susan", slug: "susan-cain"},
    %{name: "Suzanne Collins", sortable_name: "Collins, Suzanne", slug: "suzanne-collins"},
    %{name: "Svetlana Alexievich", sortable_name: "Alexievich, Svetlana", slug: "svetlana-alexievich"},
    %{name: "Ta-Nehisi Coates", sortable_name: "Coates, Ta-Nehisi", slug: "ta-nehisi-coates"},
    %{name: "Thomas Cahill", sortable_name: "Cahill, Thomas", slug: "thomas-cahill"},
    %{name: "Thomas Harris", sortable_name: "Harris, Thomas", slug: "thomas-harris"},
    %{name: "Thomas J. Stanley", sortable_name: "Stanley, Thomas J.", slug: "thomas-j-stanley"},
    %{name: "Tom Barbash", sortable_name: "Barbash, Tom", slug: "tom-barbash"},
    %{name: "Tom Wolfe", sortable_name: "Wolfe, Tom", slug: "tom-wolfe"},
    %{name: "Tovah P. Klein", sortable_name: "Klein, Tovah P.", slug: "tovah-p-klein"},
    %{name: "Tricia Sullivan", sortable_name: "Sullivan, Tricia", slug: "tricia-sullivan"},
    %{name: "Tyler Cowen", sortable_name: "Cowen, Tyler", slug: "tyler-cowen"},
    %{name: "Umberto Eco", sortable_name: "Eco, Umberto", slug: "umberto-eco"},
    %{name: "Upton Sinclair", sortable_name: "Sinclair, Upton", slug: "upton-sinclair"},
    %{name: "Ursula K. Le Guin", sortable_name: "Le Guin, Ursula K.", slug: "ursula-k-le-guin"},
    %{name: "Viktor E. Frankl", sortable_name: "Frankl, Viktor E.", slug: "viktor-e-frankl"},
    %{name: "Walter Isaacson", sortable_name: "Isaacson, Walter", slug: "walter-isaacson"},
    %{name: "Walter Jon Williams", sortable_name: "Williams, Walter Jon", slug: "walter-jon-williams"},
    %{name: "William Gibson", sortable_name: "Gibson, William", slug: "william-gibson"},
    %{name: "William L. Shirer", sortable_name: "Shirer, William L.", slug: "william-l-shirer"},
    %{name: "William Strunk Jr", sortable_name: "Strunk Jr, William", slug: "william-strunk-jr"},
    %{name: "Wilson Rawls", sortable_name: "Rawls, Wilson", slug: "wilson-rawls"},
    %{name: "Zeynep Ton", sortable_name: "Ton, Zeynep", slug: "zeynep-ton"},
  ]

  def seed_authors do
    Enum.each(@author_data, fn author ->
      struct(Author, author)
      |>Repo.insert(on_conflict: :nothing)
    end)
    IO.puts("inserted authors")
  end

end