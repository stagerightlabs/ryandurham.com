defmodule Library.Seeds do
  alias Library.Author
  alias Library.Book
  alias Library.Repo

  def run do
    seed_authors()
  end

  @author_data [
    %{name: "Abraham Verghese", sortable_name: "verghese, abraham", slug: "abraham-verghese"},
    %{name: "Agatha Christie", sortable_name: "christie, agatha", slug: "agatha-christie"},
    %{name: "Alan Moore", sortable_name: "moore alan", slug: "alan-moore"},
    %{name: "Alan Schom", sortable_name: "schom, alan", slug: "alan-schom"},
    %{name: "Alex Stone", sortable_name: "stone, alex", slug: "alex-stone"},
    %{name: "Alice Sebold", sortable_name: "sebold, alice", slug: "alice-sebold"},
    %{
      name: "Andreas M. Antonopoulos",
      sortable_name: "antonopoulos, andreas m.",
      slug: "andreas-m-antonopoulos"
    },
    %{name: "Andrew Hodges", sortable_name: "hodges, andrew", slug: "andrew-hodges"},
    %{name: "Andrew Mayne", sortable_name: "mayne, andrew", slug: "andrew-mayne"},
    %{name: "Andy Weir", sortable_name: "weir, andy", slug: "andy-weir"},
    %{name: "Anthony Bourdain", sortable_name: "bourdain, anthony", slug: "anthony-bourdain"},
    %{name: "Antony Sher", sortable_name: "sher, antony", slug: "antony-sher"},
    %{name: "Armin A. Brott", sortable_name: "brott, armin a.", slug: "armin-a-brott"},
    %{
      name: "Arthur Conan Doyle",
      sortable_name: "doyle, arthur conan",
      slug: "arthur-conan-doyle"
    },
    %{name: "Arthur Golden", sortable_name: "golden, aurthur", slug: "arthur-golden"},
    %{name: "Ashlee Vance", sortable_name: "vance, ashlee", slug: "ashlee-vance"},
    %{name: "Barack Obama", sortable_name: "obama, barack", slug: "barack-obama"},
    %{name: "Barry Pollard", sortable_name: "pollard, barry", slug: "barry-pollard"},
    %{name: "Barry Schwartz", sortable_name: "schwartz, barry", slug: "barry-schwartz"},
    %{name: "Bernard Cornwell", sortable_name: "cornwell, bernard", slug: "bernard-cornwell"},
    %{name: "Bill Browder", sortable_name: "browder, bill", slug: "bill-browder"},
    %{name: "Bill Bryson", sortable_name: "bryson, bill", slug: "bill-bryson"},
    %{name: "Brad Stone", sortable_name: "stone, brad", slug: "brad-stone"},
    %{name: "Brad Warner", sortable_name: "warner, brad", slug: "brad-warner"},
    %{name: "Brent Walth", sortable_name: "walth, brent", slug: "brent-walth"},
    %{name: "Bruce Campbell", sortable_name: "campbell, bruce", slug: "bruce-campbell"},
    %{name: "Bruce Tate", sortable_name: "tate, bruce", slug: "bruce-tate"},
    %{name: "C.S. Lewis", sortable_name: "lewis, c.s.", slug: "cs-lewis"},
    %{name: "Cal Newport", sortable_name: "newport, cal", slug: "cal-newport"},
    %{name: "Caleb Carr", sortable_name: "carr, caleb", slug: "caleb-carr"},
    %{name: "Caleb Doxsey", sortable_name: "doxsey, caleb", slug: "caleb-doxsey"},
    %{name: "Candice Millard", sortable_name: "millard, candice", slug: "candice-millard"},
    %{name: "Carl Sagan", sortable_name: "sagan, carl", slug: "carl-sagan"},
    %{name: "Carol Nichols", sortable_name: "nichols, carol", slug: "carol-nichols"},
    %{name: "Charles C. Mann", sortable_name: "mann, charles c.", slug: "charles-c-mann"},
    %{name: "Charles Petzold", sortable_name: "petzold, charles", slug: "charles-petzold"},
    %{name: "Chris McCord", sortable_name: "mccord, chris", slug: "chris-mccord"},
    %{
      name: "Christian Grobmeier",
      sortable_name: "grobmeier, christian",
      slug: "christian-grobmeier"
    },
    %{
      name: "Christopher Hitchens",
      sortable_name: "hitchens, christopher",
      slug: "christopher-hitchens"
    },
    %{name: "Chuck Palahniuk", sortable_name: "palahniuk, chuck", slug: "chuck-palahniuk"},
    %{name: "Claire Willett", sortable_name: "willett, claire", slug: "claire-willett"},
    %{name: "Cooper Moo", sortable_name: "moo, cooper", slug: "cooper-moo"},
    %{name: "Cormac McCarthy", sortable_name: "mccarthy, cormac", slug: "cormac-mccarthy"},
    %{name: "Cory Doctorow", sortable_name: "doctorow, cory", slug: "cory-doctorow"},
    %{name: "Craig Ferguson", sortable_name: "ferguson, craig", slug: "craig-ferguson"},
    %{name: "Dan Nemeth", sortable_name: "nemeth, dan", slug: "dan-nemeth"},
    %{name: "Dan Simmons", sortable_name: "simmons, dan", slug: "dan-simmons"},
    %{name: "Daniel J. Barrett", sortable_name: "barrett, daniel j.", slug: "daniel-j-barrett"},
    %{name: "Daniel Suarez", sortable_name: "suarez, daniel", slug: "daniel-suarez"},
    %{name: "Dave Gibbons", sortable_name: "gibbons, dave", slug: "dave-gibbons"},
    %{name: "Dave Isay", sortable_name: "isay, dave", slug: "dave-isay"},
    %{name: "David Grann", sortable_name: "grann, david", slug: "david-grann"},
    %{
      name: "David Herbert Donald",
      sortable_name: "donald, david herbert",
      slug: "david-herbert-donald"
    },
    %{name: "David Mitchell", sortable_name: "mitchell, david", slug: "david-mitchell"},
    %{name: "David Weber", sortable_name: "weber, david", slug: "david-weber"},
    %{name: "Denise Kiernam", sortable_name: "kiernam, denise", slug: "denise-kiernam"},
    %{name: "Dick DeBartolo", sortable_name: "debartolo, dick", slug: "dick-debartolo"},
    %{name: "Douglas Adams", sortable_name: "adams, douglas", slug: "douglas-adams"},
    %{name: "Edwin Lefèvre", sortable_name: "lefèvre, edwin", slug: "edwin-lefevre"},
    %{name: "Ellen Feldman", sortable_name: "feldman, ellen", slug: "ellen-feldman"},
    %{name: "Eric Redmond", sortable_name: "redmond, eric", slug: "eric-redmond"},
    %{name: "Erik Bear", sortable_name: "bear, erik", slug: "erik-bear"},
    %{name: "Erik Larson", sortable_name: "larson, erik", slug: "erik-larson"},
    %{name: "Ernest Cline", sortable_name: "cline, ernest", slug: "ernest-cline"},
    %{name: "Ernest Hemingway", sortable_name: "hemingway, ernest", slug: "ernest-hemingway"},
    %{name: "Ernest Kurtz", sortable_name: "kurtz, ernest", slug: "ernest-kurtz"},
    %{name: "Ethan Mordden", sortable_name: "mordden, ethan", slug: "ethan-mordden"},
    %{name: "Eugene E. Snyder", sortable_name: "snyder, eugene e.", slug: "eugene-e-snyder"},
    %{name: "Evan Hughes", sortable_name: "hughes, evan", slug: "evan-hughes"},
    %{name: "Eve Curie", sortable_name: "curie, eve", slug: "eve-curie"},
    %{name: "Frank Herbert", sortable_name: "herbert, frank", slug: "frank-herbert"},
    %{name: "Frank McCourt", sortable_name: "mccourt, frank", slug: "frank-mccourt"},
    %{
      name: "Frederick P. Brooks",
      sortable_name: "brooks, frederick p.",
      slug: "frederick-p-brooks"
    },
    %{
      name: "Gabrielle Hamilton",
      sortable_name: "hamilton, gabrielle",
      slug: "gabrielle-hamilton"
    },
    %{name: "Garrett Hardin", sortable_name: "hardin, garrett", slug: "garrett-hardin"},
    %{name: "Geoffrey Lessel", sortable_name: "lessel, geoffrey", slug: "geoffrey-lessel"},
    %{name: "George Orwell", sortable_name: "orwell, george", slug: "george-orwell"},
    %{name: "George R.R. Martin", sortable_name: "martin, george r.R.", slug: "george-rr-martin"},
    %{name: "George S. Clason", sortable_name: "clason, george s.", slug: "george-s-clason"},
    %{name: "Greg Bear", sortable_name: "bear, greg", slug: "greg-bear"},
    %{name: "Hans Rosling", sortable_name: "rosling, hans", slug: "hans-rosling"},
    %{name: "Haruki Murakami", sortable_name: "murakami, haruki", slug: "haruki-murakami"},
    %{name: "Helen Epstein", sortable_name: "epstein, helen", slug: "helen-epstein"},
    %{name: "Huggy Rao", sortable_name: "rao, huggy", slug: "huggy-rao"},
    %{name: "J.D. Robb", sortable_name: "robb, j.d.", slug: "j-d-robb"},
    %{
      name: "J. David Eisenberg",
      sortable_name: "eisenberg, david j.",
      slug: "j-david-eisenberg"
    },
    %{name: "J.D. Vance", sortable_name: "vance, j.d.", slug: "jd-vance"},
    %{name: "J.K. Rowling", sortable_name: "rowling, j.k.", slug: "jk-rowling"},
    %{name: "Jack Herer", sortable_name: "herer, jack", slug: "jack-herer"},
    %{name: "Jennifer Ash", sortable_name: "ash, jennifer", slug: "jennifer-ash"},
    %{name: "Jennifer Davis", sortable_name: "davis, jennifer", slug: "jennifer-davis"},
    %{name: "Jennifer Egan", sortable_name: "egan, jennifer", slug: "jennifer-egan"},
    %{name: "Jessica Lahey", sortable_name: "lahey, jessica", slug: "jessica-lahey"},
    %{name: "Jim. R. Wilson", sortable_name: "r. wilson, Jim.", slug: "jim-r-wilson"},
    %{name: "Joanne Nordling", sortable_name: "nordling, joanne", slug: "joanne-nordling"},
    %{name: "Joel Fuhrman", sortable_name: "fuhrman, joel", slug: "joel-fuhrman"},
    %{name: "John Adams", sortable_name: "adams, john", slug: "john-adams"},
    %{name: "John D. Snider", sortable_name: "d. snider, John", slug: "john-d-snider"},
    %{name: "John Irving", sortable_name: "irving, john", slug: "john-irving"},
    %{
      name: "John Kennedy Toole",
      sortable_name: "toole, john kennedy",
      slug: "john-kennedy-toole"
    },
    %{name: "John Perkins", sortable_name: "perkins, john", slug: "john-perkins"},
    %{name: "John Trombold", sortable_name: "trombold, john", slug: "john-trombold"},
    %{name: "John Updike", sortable_name: "updike, john", slug: "john-updike"},
    %{name: "Jon Gertner", sortable_name: "gertner, jon", slug: "jon-gertner"},
    %{name: "Jon Kabat-Zinn", sortable_name: "kabat-zinn, jon", slug: "jon-kabat-zinn"},
    %{name: "Jonah Lehrer", sortable_name: "lehrer, jonah", slug: "jonah-lehrer"},
    %{name: "Jonathan Haidt", sortable_name: "haidt, jonathan", slug: "jonathan-haidt"},
    %{name: "José Valim", sortable_name: "valim, josé", slug: "jose-valim"},
    %{name: "Joseph Brassey", sortable_name: "brassey, joseph", slug: "joseph-brassey"},
    %{name: "Joseph D'Agnese", sortable_name: "d'agnese, joseph", slug: "joseph-dagnese"},
    %{name: "Katherine Daniels", sortable_name: "daniels, katherine", slug: "katherine-daniels"},
    %{name: "Katherine Ketcham", sortable_name: "ketcham, katherine", slug: "katherine-ketcham"},
    %{name: "Kazuo Ishiguro", sortable_name: "ishiguro, kazuo", slug: "kazuo-ishiguro"},
    %{name: "Ken Follet", sortable_name: "follet, ken", slug: "ken-follet"},
    %{name: "Kevin Hoffman", sortable_name: "hoffman, kevin", slug: "kevin-hoffman"},
    %{name: "Kevin Mitnick", sortable_name: "mitnick, kevin", slug: "kevin-mitnick"},
    %{name: "Kevin Sampsell", sortable_name: "sampsell, kevin", slug: "kevin-sampsell"},
    %{name: "Laura Hillenbrand", sortable_name: "hillenbrand, laura", slug: "laura-hillenbrand"},
    %{name: "Lawrence Lessig", sortable_name: "lessig, lawrence", slug: "lawrence-lessig"},
    %{name: "Lawrence Wright", sortable_name: "wright, lawrence", slug: "lawrence-wright"},
    %{name: "Leo Hsu", sortable_name: "hsu, leo", slug: "leo-hsu"},
    %{name: "Lisa A. Phillips", sortable_name: "phillips, lisa a.", slug: "lisa-a-phillips"},
    %{
      name: "Louis De Bernieres",
      sortable_name: "de bernieres, louis",
      slug: "louis-de-bernieres"
    },
    %{name: "Luc Perkins", sortable_name: "perkins, luc", slug: "luc-perkins"},
    %{name: "M.T. Anderson", sortable_name: "anderson, m.t.", slug: "mt-anderson"},
    %{name: "Malcolm Gladwell", sortable_name: "gladwell, malcolm", slug: "malcolm-gladwell"},
    %{name: "Marcus Aurelius", sortable_name: "aurelius, marcus", slug: "marcus-aurelius"},
    %{name: "Margaret Cheney", sortable_name: "cheney, margaret", slug: "margaret-cheney"},
    %{
      name: "Margot Lee Shetterly",
      sortable_name: "lee shetterly, margot",
      slug: "margot-lee-shetterly"
    },
    %{name: "Maria Konnikova", sortable_name: "konnikova, maria", slug: "maria-konnikova"},
    %{name: "Mark Bittman", sortable_name: "bittman, mark", slug: "mark-bittman"},
    %{name: "Mark Frost", sortable_name: "frost, mark", slug: "mark-frost"},
    %{name: "Mark Teppo", sortable_name: "teppo, mark", slug: "mark-teppo"},
    %{name: "Mark Twain", sortable_name: "twain, mark", slug: "mark-twain"},
    %{name: "Marquis James", sortable_name: "james, marquis", slug: "marquis-james"},
    %{name: "Masaji Ishikawa", sortable_name: "ishikawa, masaji", slug: "masaji-ishikawa"},
    %{name: "Matt Ruff", sortable_name: "ruff, matt", slug: "matt-ruff"},
    %{name: "Max Brooks", sortable_name: "brooks, max", slug: "max-brooks"},
    %{name: "Meg Meeker", sortable_name: "meeker, meg", slug: "meg-meeker"},
    %{name: "Michael Crichton", sortable_name: "crichton, michael", slug: "michael-crichton"},
    %{name: "Michael Pollan", sortable_name: "pollan, michael", slug: "michael-pollan"},
    %{name: "Mike Shanahan", sortable_name: "shanahan, mike", slug: "mike-shanahan"},
    %{name: "Myla Kabat-Zinn", sortable_name: "kabat-zinn, myla", slug: "myla-kabat-zinn"},
    %{name: "Neal Stephenson", sortable_name: "stephenson, neal", slug: "neal-stephenson"},
    %{
      name: "Neil Degrasse Tyson",
      sortable_name: "tyson, neil degrasse",
      slug: "neil-degrasse-tyson"
    },
    %{name: "Neil Gaiman", sortable_name: "gaiman, neil", slug: "neil-gaiman"},
    %{name: "Nicole Galland", sortable_name: "galland, nicole", slug: "nicole-galland"},
    %{name: "Noel Kingsbury", sortable_name: "kingsbury, noel", slug: "noel-kingsbury"},
    %{name: "Oliver Sacks", sortable_name: "sacks, oliver", slug: "oliver-sacks"},
    %{name: "Paul Johnson", sortable_name: "johnson, paul", slug: "paul-johnson"},
    %{name: "Paul Redmond", sortable_name: "redmond, paul", slug: "paul-redmond"},
    %{name: "Paul Rogat Loeb", sortable_name: "rogat, loeb paul", slug: "paul-rogat-loeb"},
    %{name: "Penn Jillette", sortable_name: "jillette, penn", slug: "penn-jillette"},
    %{name: "Peter F. Hamilton", sortable_name: "hamilton, peter f.", slug: "peter-f-hamilton"},
    %{name: "Philip Roth", sortable_name: "roth, philip", slug: "philip-roth"},
    %{name: "Phillip K. Dick", sortable_name: "dick, phillip k.", slug: "phillip-k-dick"},
    %{name: "Phillip Pullman", sortable_name: "pullman, phillip", slug: "phillip-pullman"},
    %{name: "Piers Anthony", sortable_name: "anthony, piers", slug: "piers-anthony"},
    %{name: "Ray Monk", sortable_name: "monk, ray", slug: "ray-monk"},
    %{name: "Rebecca Solnit", sortable_name: "solnit, rebecca", slug: "rebecca-solnit"},
    %{name: "Regina Obe", sortable_name: "obe, regina", slug: "regina-obe"},
    %{name: "Richard K. Morgan", sortable_name: "morgan, richard k.", slug: "richard-k-morgan"},
    %{name: "Robert Heinlein", sortable_name: "heinlein, robert", slug: "robert-heinlein"},
    %{name: "Robert I. Sutton", sortable_name: "sutton, robert i.", slug: "robert-i-sutton"},
    %{name: "Robert Kiyosaki", sortable_name: "kiyosaki, robert", slug: "robert-kiyosaki"},
    %{name: "Roger J. Davies", sortable_name: "davies, roger j.", slug: "roger-j-davies"},
    %{name: "Ryan Holiday", sortable_name: "holiday, ryan", slug: "ryan-holiday"},
    %{name: "Sam Harris", sortable_name: "harris, sam", slug: "sam-harris"},
    %{name: "Sam Quinones", sortable_name: "quinones, sam", slug: "sam-quinones"},
    %{name: "Sandi Metz", sortable_name: "metz, sandi", slug: "sandi-metz"},
    %{name: "Sara Gruen", sortable_name: "gruen, sara", slug: "sara-gruen"},
    %{name: "Saša Jurić", sortable_name: "jurić, saša", slug: "sasa-juric"},
    %{name: "Simon St. Laurent", sortable_name: "st. laurent, Simon", slug: "simon-st-laurent"},
    %{
      name: "Stephen E. Ambrose",
      sortable_name: "ambrose, stephen e.",
      slug: "stephen-e-ambrose"
    },
    %{name: "Stephen Hawking", sortable_name: "hawking, stephen", slug: "stephen-hawking"},
    %{name: "Stephen Johnson", sortable_name: "johnson, stephen", slug: "stephen-johnson"},
    %{name: "Stephen King", sortable_name: "king, stephen", slug: "stephen-king"},
    %{name: "Steve Klabnik", sortable_name: "klabnik, steve", slug: "steve-klabnik"},
    %{name: "Steven Pinker", sortable_name: "pinker, steven", slug: "steven-pinker"},
    %{name: "Stieg Larson", sortable_name: "larson, stieg", slug: "stieg-larson"},
    %{name: "Susan Cain", sortable_name: "cain, susan", slug: "susan-cain"},
    %{name: "Suzanne Collins", sortable_name: "collins, suzanne", slug: "suzanne-collins"},
    %{
      name: "Svetlana Alexievich",
      sortable_name: "alexievich, svetlana",
      slug: "svetlana-alexievich"
    },
    %{name: "Ta-Nehisi Coates", sortable_name: "coates, ta-nehisi", slug: "ta-nehisi-coates"},
    %{name: "Thomas Cahill", sortable_name: "cahill, thomas", slug: "thomas-cahill"},
    %{name: "Thomas Harris", sortable_name: "harris, thomas", slug: "thomas-harris"},
    %{name: "Thomas J. Stanley", sortable_name: "stanley, thomas j.", slug: "thomas-j-stanley"},
    %{name: "Tom Barbash", sortable_name: "barbash, tom", slug: "tom-barbash"},
    %{name: "Tom Wolfe", sortable_name: "wolfe, tom", slug: "tom-wolfe"},
    %{name: "Tovah P. Klein", sortable_name: "klein, tovah p.", slug: "tovah-p-klein"},
    %{name: "Tricia Sullivan", sortable_name: "sullivan, tricia", slug: "tricia-sullivan"},
    %{name: "Tyler Cowen", sortable_name: "cowen, tyler", slug: "tyler-cowen"},
    %{name: "Umberto Eco", sortable_name: "eco, umberto", slug: "umberto-eco"},
    %{name: "Upton Sinclair", sortable_name: "sinclair, upton", slug: "upton-sinclair"},
    %{name: "Ursula K. Le Guin", sortable_name: "le guin, ursula k.", slug: "ursula-k-le-guin"},
    %{name: "Viktor E. Frankl", sortable_name: "frankl, viktor e.", slug: "viktor-e-frankl"},
    %{name: "Walter Isaacson", sortable_name: "isaacson, walter", slug: "walter-isaacson"},
    %{
      name: "Walter Jon Williams",
      sortable_name: "williams, walter jon",
      slug: "walter-jon-williams"
    },
    %{name: "William Gibson", sortable_name: "gibson, william", slug: "william-gibson"},
    %{name: "William L. Shirer", sortable_name: "shirer, william l.", slug: "william-l-shirer"},
    %{name: "William Strunk Jr", sortable_name: "strunk jr, william", slug: "william-strunk-jr"},
    %{name: "Wilson Rawls", sortable_name: "rawls, wilson", slug: "wilson-rawls"},
    %{name: "Zeynep Ton", sortable_name: "ton, zeynep", slug: "zeynep-ton"}
  ]

  @book_data [
    %{
      title: "1491",
      sortable_title: "1491",
      slug: "1491",
      year: nil,
      isbn13: "978-1400032051",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "1984",
      sortable_title: "1984",
      slug: "1984",
      year: nil,
      isbn13: "978-0452284234",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "1Q84",
      sortable_title: "1q84",
      slug: "1q84",
      year: 2011,
      isbn13: "9780307593313",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Across the River and Into the Trees",
      sortable_title: "across the river and into the trees",
      slug: "across-the-river-and-into-the-trees",
      year: 1950,
      isbn13: "9781784872038",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Alan Turning: The Enigma",
      sortable_title: "alan turning: the enigma",
      slug: "alan-turning-the-enigma",
      year: 1983,
      isbn13: "9781400865123",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "The Alienist",
      sortable_title: "alienist",
      slug: "the-alienist",
      year: nil,
      isbn13: "812976142",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Almost Moon",
      sortable_title: "almost moon",
      slug: "the-almost-moon",
      year: nil,
      isbn13: "978-0316677462",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Altered Carbon",
      sortable_title: "altered carbon",
      slug: "altered-carbon",
      year: 2003,
      isbn13: "9780345457684",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "American Gods",
      sortable_title: "american gods",
      slug: "american-gods",
      year: nil,
      isbn13: "978-0380789030",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "American on Purpose",
      sortable_title: "american on purpose",
      slug: "american-on-purpose",
      year: 2009,
      isbn13: "9780061719547",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Anansi Boys",
      sortable_title: "anansi boys",
      slug: "anansi-boys",
      year: 2005,
      isbn13: "9780060515195",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Angela’s Ashes",
      sortable_title: "angela’s ashes",
      slug: "angelas-ashes",
      year: nil,
      isbn13: "9780684842677",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Angel Killer",
      sortable_title: "angel killer",
      slug: "angel-killer",
      year: nil,
      isbn13: "978-0062348876",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Better Angels of Our Nature",
      sortable_title: "better angels of our nature",
      slug: "the-better-angels-of-our-nature",
      year: nil,
      isbn13: "978-0143122012",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Between The World and Me",
      sortable_title: "between the world and me",
      slug: "between-the-world-and-me",
      year: 2015,
      isbn13: "9780812993547",
      purchase_url: "http://www.powells.com/book/between-the-world-and-me-9780812993547/18-0",
      category: "Non-Fiction"
    },
    %{
      title: "The Big U",
      sortable_title: "big u",
      slug: "the-big-u",
      year: nil,
      isbn13: "978-0380816033",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Blink",
      sortable_title: "blink",
      slug: "blink",
      year: nil,
      isbn13: "978-0316010665",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Blood, Bones and Butter",
      sortable_title: "blood, bones and butter",
      slug: "blood-bones-and-butter",
      year: nil,
      isbn13: "140006872X",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Blood Merridian",
      sortable_title: "blood merridian",
      slug: "blood-merridian",
      year: nil,
      isbn13: "978-0679728757",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "A Brief History of Time",
      sortable_title: "brief history of time",
      slug: "a-brief-history-of-time",
      year: nil,
      isbn13: "978-0553380163",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Caring Discipline",
      sortable_title: "caring discipline",
      slug: "caring-discipline",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Catching Fire",
      sortable_title: "catching fire",
      slug: "catching-fire",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Churchill",
      sortable_title: "churchill",
      slug: "churchill",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "The Cider House Rules",
      sortable_title: "cider house rules",
      slug: "the-cider-house-rules",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Cloud Atlas",
      sortable_title: "cloud atlas",
      slug: "cloud-atlas",
      year: 2004,
      isbn13: "9780375507250",
      purchase_url: "http://www.powells.com/book/cloud-atlas-9780375507250/17-0",
      category: "Fiction"
    },
    %{
      title: "Cloud Native Go",
      sortable_title: "cloud native go",
      slug: "cloud-native-go",
      year: 2016,
      isbn13: "9780134505800",
      purchase_url: nil,
      category: "Technical"
    },
    %{
      title: "Cobweb",
      sortable_title: "cobweb",
      slug: "cobweb",
      year: nil,
      isbn13: "978-0553383447",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Code",
      sortable_title: "code",
      slug: "code",
      year: nil,
      isbn13: "978-0735611313",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Complete Sherlock Holmes",
      sortable_title: "complete sherlock holmes",
      slug: "the-complete-sherlock-holmes",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "A Confederacy of Dunces",
      sortable_title: "confederacy of dunces",
      slug: "a-confederacy-of-dunces",
      year: nil,
      isbn13: "978-0802130204",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Confessions of an Economic Hitman",
      sortable_title: "confessions of an economic hitman",
      slug: "confessions-of-an-economic-hitman",
      year: nil,
      isbn13: "978-0452287082",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Confusion",
      sortable_title: "confusion",
      slug: "the-confusion",
      year: 2004,
      isbn13: "9780060523862",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "A Connecticut Yankee in King Arthur’s Court",
      sortable_title: "connecticut yankee in king arthur’s court",
      slug: "a-connecticut-yankee-in-king-arthurs-court",
      year: nil,
      isbn13: "978-0451524751",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Coraline",
      sortable_title: "coraline",
      slug: "coraline",
      year: nil,
      isbn13: "978-0380807345",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Corelli's Mandolin ",
      sortable_title: "corelli's mandolin ",
      slug: "corellis-mandolin",
      year: 1995,
      isbn13: "9780679763970",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Cryptonomicon",
      sortable_title: "cryptonomicon",
      slug: "cryptonomicon",
      year: nil,
      isbn13: "978-0380973460",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Cutting for Stone",
      sortable_title: "cutting for stone",
      slug: "cutting-for-stone",
      year: nil,
      isbn13: "978-0375714368",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Daemon",
      sortable_title: "daemon",
      slug: "daemon",
      year: nil,
      isbn13: "978-0451228734",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Dance Dance Dance",
      sortable_title: "dance dance dance",
      slug: "dance-dance-dance",
      year: 1988,
      isbn13: "9780679753797",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "The Demon Haunted World",
      sortable_title: "demon haunted world",
      slug: "the-demon-haunted-world",
      year: nil,
      isbn13: "978-0345409461",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Destiny of the Republic",
      sortable_title: "destiny of the republic",
      slug: "destiny-of-the-republic",
      year: nil,
      isbn13: "978-0385526265",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Devil in the White City",
      sortable_title: "devil in the white city",
      slug: "devil-in-the-white-city",
      year: nil,
      isbn13: "978-0375725609",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Diamond Age",
      sortable_title: "diamond age",
      slug: "the-diamond-age",
      year: nil,
      isbn13: "978-0553380965",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Difference Engine",
      sortable_title: "difference engine",
      slug: "the-difference-engine",
      year: nil,
      isbn13: "978-0440423621",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Digital Minimalism",
      sortable_title: "digital minimalism",
      slug: "digital-minimalism",
      year: 2019,
      isbn13: "9780525536512",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Dirk Gentlys Holistic Detective Agency",
      sortable_title: "dirk gentlys holistic detective agency",
      slug: "dirk-gentlys-holistic-detective-agency",
      year: 1985,
      isbn13: "9780671746728",
      purchase_url:
        "http://www.powells.com/book/dirk-gentlys-holistic-detective-agency-9780671746728/1-4",
      category: "Fiction"
    },
    %{
      title: "Disclosure",
      sortable_title: "disclosure",
      slug: "disclosure",
      year: nil,
      isbn13: "978-0345391056",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Docker for PHP Developers",
      sortable_title: "docker for php developers",
      slug: "docker-for-php-developers",
      year: 2018,
      isbn13: nil,
      purchase_url: nil,
      category: "Technical"
    },
    %{
      title: "Dreamland",
      sortable_title: "dreamland",
      slug: "dreamland",
      year: 2015,
      isbn13: "9781620402504",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Dreams from my Father",
      sortable_title: "dreams from my father",
      slug: "dreams-from-my-father",
      year: nil,
      isbn13: "978-1400082773",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Dune",
      sortable_title: "dune",
      slug: "dune",
      year: nil,
      isbn13: "978-0441013593",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Early Portland: Stump-Town Triumphant",
      sortable_title: "early portland: stump-town triumphant",
      slug: "early-portland-stump-town-triumphant",
      year: nil,
      isbn13: "978-0832302954",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Eat to Live",
      sortable_title: "eat to live",
      slug: "eat-to-live",
      year: 2011,
      isbn13: "9780316183208",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Effective DevOps",
      sortable_title: "effective devops",
      slug: "effective-devops",
      year: 2016,
      isbn13: "9781491926307",
      purchase_url:
        "http://www.powells.com/book/effective-devops-building-a-culture-of-collaboration-affinity-tooling-at-scale-9781491926307/2-0",
      category: "Technical"
    },
    %{
      title: "Ego is the Enemy",
      sortable_title: "ego is the enemy",
      slug: "ego-is-the-enemy",
      year: 2016,
      isbn13: "9781591847816",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Einstein: His Life and Universe",
      sortable_title: "einstein: his life and universe",
      slug: "einstein-his-life-and-universe",
      year: nil,
      isbn13: "978-0743264747",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Elements of Style",
      sortable_title: "elements of style",
      slug: "the-elements-of-style",
      year: 1959,
      isbn13: "9781629101651",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Elixir In Action",
      sortable_title: "elixir in action",
      slug: "elixir-in-action",
      year: 2019,
      isbn13: "9781617295027",
      purchase_url: nil,
      category: "Technical"
    },
    %{
      title: "Elon Musk: Tesla, SpaceX, and the Quest for a Fantastic Future",
      sortable_title: "elon musk: tesla, spacex, and the quest for a fantastic future",
      slug: "elon-musk-tesla-spacex-and-the-quest-for-a-fantastic-future",
      year: 2015,
      isbn13: "9780062301253",
      purchase_url: "http://www.powells.com/book/elon-musk-9780062301253/1-6",
      category: "Non-Fiction"
    },
    %{
      title: "The Emperor Wears No Clothes",
      sortable_title: "emperor wears no clothes",
      slug: "the-emperor-wears-no-clothes",
      year: 1992,
      isbn13: "9781878125026",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "The End of Faith",
      sortable_title: "end of faith",
      slug: "the-end-of-faith",
      year: nil,
      isbn13: "978-0393035155",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Enlightenment Now",
      sortable_title: "enlightenment now",
      slug: "enlightenment-now",
      year: 2018,
      isbn13: "9780525427575",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Everyday Blessings",
      sortable_title: "everyday blessings",
      slug: "everyday-blessings",
      year: 1998,
      isbn13: "9780786883141",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "The Everything Store",
      sortable_title: "everything store",
      slug: "the-everything-store",
      year: nil,
      isbn13: "978-0316219280",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Expectant Father",
      sortable_title: "expectant father",
      slug: "the-expectant-father",
      year: nil,
      isbn13: "978-0789210777",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Factfulness",
      sortable_title: "factfulness",
      slug: "factfulness",
      year: 2018,
      isbn13: "9781473637467",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Fight Club",
      sortable_title: "fight club",
      slug: "fight-club",
      year: nil,
      isbn13: "978-0393327342",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Filters Against Folly",
      sortable_title: "filters against folly",
      slug: "filters-against-folly",
      year: 1986,
      isbn13: "9780140077292",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Fire At Eden's Gate",
      sortable_title: "fire at eden's gate",
      slug: "fire-at-edens-gate",
      year: 1994,
      isbn13: "9780875952475",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Food Matters",
      sortable_title: "food matters",
      slug: "food-matters",
      year: 2008,
      isbn13: "9781416575658",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Fooling Houdini",
      sortable_title: "fooling houdini",
      slug: "fooling-houdini",
      year: 2012,
      isbn13: "9781446473306",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "For Us The Living",
      sortable_title: "for us the living",
      slug: "for-us-the-living",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "For Whom The Bell Tolls",
      sortable_title: "for whom the bell tolls",
      slug: "for-whom-the-bell-tolls",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Foucault’s Pendulum",
      sortable_title: "foucault’s pendulum",
      slug: "foucaults-pendulum",
      year: nil,
      isbn13: "978-0345418272",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Freedom (TM)",
      sortable_title: "freedom (tm)",
      slug: "freedom-tm",
      year: nil,
      isbn13: "978-0451231895",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Fugitives and Refugees: A Walk in Portland, Oregon",
      sortable_title: "fugitives and refugees: a walk in portland, oregon",
      slug: "fugitives-and-refugees-a-walk-in-portland-oregon",
      year: nil,
      isbn13: "9781400047833",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Full Catastrophe Living",
      sortable_title: "full catastrophe living",
      slug: "full-catastrophe-living",
      year: nil,
      isbn13: "978-0385303125",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Game of Thrones",
      sortable_title: "game of thrones",
      slug: "game-of-thrones",
      year: nil,
      isbn13: "978-0553381689",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Garden of Eden",
      sortable_title: "garden of eden",
      slug: "the-garden-of-eden",
      year: 1986,
      isbn13: "9780684804521",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Ghost in the Wires",
      sortable_title: "ghost in the wires",
      slug: "ghost-in-the-wires",
      year: 2012,
      isbn13: "9780316037723",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Gift of Failure",
      sortable_title: "gift of failure",
      slug: "the-gift-of-failure",
      year: 2015,
      isbn13: "9780062299239",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "The Girl Who Played with Fire",
      sortable_title: "girl who played with fire",
      slug: "the-girl-who-played-with-fire",
      year: nil,
      isbn13: "978-0307454553",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Girl with the Dragon Tattoo",
      sortable_title: "girl with the dragon tattoo",
      slug: "the-girl-with-the-dragon-tattoo",
      year: nil,
      isbn13: "978-0143170099",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Gods Wasps & Stranglers The Secret History & Redemptive Future of Fig Trees ",
      sortable_title:
        "gods wasps & stranglers the secret history & redemptive future of fig trees ",
      slug: "gods-wasps-stranglers-the-secret-history-redemptive-future-of-fig-trees",
      year: 2016,
      isbn13: "9781603587143",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Going Clear: Scientology, Hollywood, and the Prison of Belief",
      sortable_title: "going clear: scientology, hollywood, and the prison of belief",
      slug: "going-clear-scientology-hollywood-and-the-prison-of-belief",
      year: nil,
      isbn13: "978-0307700667",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Golden Compass",
      sortable_title: "golden compass",
      slug: "the-golden-compass",
      year: nil,
      isbn13: "978-0440238133",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Good Days and Mad",
      sortable_title: "good days and mad",
      slug: "good-days-and-mad",
      year: nil,
      isbn13: "978-1560250913",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Good Jobs Strategy",
      sortable_title: "good jobs strategy",
      slug: "the-good-jobs-strategy",
      year: 2014,
      isbn13: "9780544114449",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Grace Hopper and the Invention of the Information Age",
      sortable_title: "grace hopper and the invention of the information age",
      slug: "grace-hopper-and-the-invention-of-the-information-age",
      year: 2009,
      isbn13: "9780262013109",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Green Hills of Africa",
      sortable_title: "green hills of africa",
      slug: "green-hills-of-africa",
      year: 1935,
      isbn13: "9780684801292",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "The Gunslinger",
      sortable_title: "gunslinger",
      slug: "the-gunslinger",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Hallelujah Junction",
      sortable_title: "hallelujah junction",
      slug: "hallelujah-junction",
      year: nil,
      isbn13: "978-0312428617",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Hardcore Zen",
      sortable_title: "hardcore zen",
      slug: "hardcore-zen",
      year: 1994,
      isbn13: "9780861719891",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Hardwired",
      sortable_title: "hardwired",
      slug: "hardwired",
      year: nil,
      isbn13: "978-1597800624",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Harry Potter and the Deathly Hallows",
      sortable_title: "harry potter and the deathly hallows",
      slug: "harry-potter-and-the-deathly-hallows",
      year: nil,
      isbn13: "978-0545139700",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Harry Potter and the Half-Blood Prince",
      sortable_title: "harry potter and the half-blood prince",
      slug: "harry-potter-and-the-half-blood-prince",
      year: nil,
      isbn13: "978-0439785969",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Hear The Wind Sing",
      sortable_title: "hear the wind sing",
      slug: "hear-the-wind-sing",
      year: 1979,
      isbn13: "9780099590422",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Hidden Figures",
      sortable_title: "hidden figures",
      slug: "hidden-figures",
      year: 2016,
      isbn13: "9780062363602",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Hillbilly Elegy",
      sortable_title: "hillbilly elegy",
      slug: "hillbilly-elegy",
      year: 2016,
      isbn13: "9780062300546",
      purchase_url: "http://www.powells.com/book/hillbilly-elegy-9780062300546/17-1",
      category: "Non-Fiction"
    },
    %{
      title: "Hitch-22",
      sortable_title: "hitch-22",
      slug: "hitch-22",
      year: 2010,
      isbn13: "9780771041150",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "The Hitchhiker’s Guide to the Galaxy",
      sortable_title: "hitchhiker’s guide to the galaxy",
      slug: "the-hitchhikers-guide-to-the-galaxy",
      year: nil,
      isbn13: "978-1400052929",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Honor of the Queen",
      sortable_title: "honor of the queen",
      slug: "the-honor-of-the-queen",
      year: nil,
      isbn13: "978-0743435727",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "How the Irish Saved Civilization",
      sortable_title: "how the irish saved civilization",
      slug: "how-the-irish-saved-civilization",
      year: nil,
      isbn13: "978-0385418492",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "How Toddlers Thrive",
      sortable_title: "how toddlers thrive",
      slug: "how-toddlers-thrive",
      year: 2014,
      isbn13: "9781476735139",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "How We Got to Now",
      sortable_title: "how we got to now",
      slug: "how-we-got-to-now",
      year: nil,
      isbn13: "978-1594632969",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "HTTP/2 In Action",
      sortable_title: "http/2 in action",
      slug: "http2-in-action",
      year: 2019,
      isbn13: "9781617295164",
      purchase_url: nil,
      category: "Technical"
    },
    %{
      title: "The Hunger Games",
      sortable_title: "hunger games",
      slug: "the-hunger-games",
      year: nil,
      isbn13: "978-0439023481",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Hybrid",
      sortable_title: "hybrid",
      slug: "hybrid",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "The Idea Factory",
      sortable_title: "idea factory",
      slug: "the-idea-factory",
      year: nil,
      isbn13: "978-0143122791",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "If Chins Could Kill",
      sortable_title: "if chins could kill",
      slug: "if-chins-could-kill",
      year: 2001,
      isbn13: "9780312291457",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Ilium",
      sortable_title: "ilium",
      slug: "ilium",
      year: nil,
      isbn13: "978-0380817924",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "I Love Books",
      sortable_title: "i love books",
      slug: "i-love-books",
      year: 1946,
      isbn13: nil,
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "The Innovators",
      sortable_title: "innovators",
      slug: "the-innovators",
      year: nil,
      isbn13: "9781476708690",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Interface",
      sortable_title: "interface",
      slug: "interface",
      year: nil,
      isbn13: "978-0553383430",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Internet of Money, Vol 1",
      sortable_title: "internet of money, vol 1",
      slug: "the-internet-of-money-vol-1",
      year: 2016,
      isbn13: "9781537000459",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "The Internet of Money, Vol 2",
      sortable_title: "internet of money, vol 2",
      slug: "the-internet-of-money-vol-2",
      year: 2017,
      isbn13: "9781947910065",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "In the Garden of Beasts",
      sortable_title: "in the garden of beasts",
      slug: "in-the-garden-of-beasts",
      year: nil,
      isbn13: "978-0307408853",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Introducing Elixir",
      sortable_title: "introducing elixir",
      slug: "introducing-elixir",
      year: 2016,
      isbn13: "9781491956779",
      purchase_url: nil,
      category: "Technical"
    },
    %{
      title: "Introducing Go",
      sortable_title: "introducing go",
      slug: "introducing-go",
      year: 2016,
      isbn13: "9781491942017",
      purchase_url: nil,
      category: "Technical"
    },
    %{
      title: "The Japanese Mind",
      sortable_title: "japanese mind",
      slug: "the-japanese-mind",
      year: 2002,
      isbn13: "9780804832953",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Joe Papp: An American Life",
      sortable_title: "joe papp: an american life",
      slug: "joe-papp-an-american-life",
      year: nil,
      isbn13: "978-0306806766",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Killers of the Flower Moon",
      sortable_title: "killers of the flower moon",
      slug: "killers-of-the-flower-moon",
      year: 2017,
      isbn13: "9780385534246",
      purchase_url:
        "http://www.powells.com/book/killers-of-the-flower-moon-the-osage-murders-the-birth-of-the-fbi-9780385534246/62-0",
      category: "Non-Fiction"
    },
    %{
      title: "Kitchen Confidential",
      sortable_title: "kitchen confidential",
      slug: "kitchen-confidential",
      year: nil,
      isbn13: "978-0060899226",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Last Kingdom",
      sortable_title: "last kingdom",
      slug: "the-last-kingdom",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Left Hand of Darkness",
      sortable_title: "left hand of darkness",
      slug: "the-left-hand-of-darkness",
      year: 1969,
      isbn13: "9780441007318",
      purchase_url: "http://www.powells.com/book/left-hand-of-darkness-9780441007318/62-0",
      category: "Fiction"
    },
    %{
      title: "Letters to a Young Contrarian",
      sortable_title: "letters to a young contrarian",
      slug: "letters-to-a-young-contrarian",
      year: 2001,
      isbn13: "0-465-03033-5",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "The Life of Andrew Jackson",
      sortable_title: "life of andrew jackson",
      slug: "the-life-of-andrew-jackson",
      year: 1938,
      isbn13: nil,
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Lincoln",
      sortable_title: "lincoln",
      slug: "lincoln",
      year: nil,
      isbn13: "978-0684808468",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Linux Pocket Guide",
      sortable_title: "linux pocket guide",
      slug: "linux-pocket-guide",
      year: 2016,
      isbn13: "9781491927571",
      purchase_url: nil,
      category: "Technical"
    },
    %{
      title: "Listening is an Act of Love",
      sortable_title: "listening is an act of love",
      slug: "listening-is-an-act-of-love",
      year: nil,
      isbn13: "978-0143114345",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The List of Seven",
      sortable_title: "list of seven",
      slug: "the-list-of-seven",
      year: nil,
      isbn13: "978-0380720194",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Literary Brooklyn",
      sortable_title: "literary brooklyn",
      slug: "literary-brooklyn",
      year: nil,
      isbn13: "978-0805089868",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Little Brother",
      sortable_title: "little brother",
      slug: "little-brother",
      year: nil,
      isbn13: "978-0765323118",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Long Dark Tea-Time of the Soul",
      sortable_title: "long dark tea-time of the soul",
      slug: "the-long-dark-tea-time-of-the-soul",
      year: 1988,
      isbn13: "9781476739656",
      purchase_url:
        "http://www.powells.com/book/the-long-dark-tea-time-of-the-soul-9781476739656/18-0",
      category: "Fiction"
    },
    %{
      title: "Lords of the North",
      sortable_title: "lords of the north",
      slug: "lords-of-the-north",
      year: nil,
      isbn13: "978-0061149047",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Lovecraft Country",
      sortable_title: "lovecraft country",
      slug: "lovecraft-country",
      year: 2016,
      isbn13: "9780062292087",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Madame Curie: A Biography",
      sortable_title: "madame curie: a biography",
      slug: "madame-curie-a-biography",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "The Man in the High Castle",
      sortable_title: "man in the high castle",
      slug: "the-man-in-the-high-castle",
      year: 1962,
      isbn13: "9780544916081",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Man's Search for Meaning",
      sortable_title: "man's search for meaning",
      slug: "mans-search-for-meaning",
      year: nil,
      isbn13: "978-0807014295",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Man Who Mistook His Wife for a Hat",
      sortable_title: "man who mistook his wife for a hat",
      slug: "the-man-who-mistook-his-wife-for-a-hat",
      year: nil,
      isbn13: "978-0684853949",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Martian",
      sortable_title: "martian",
      slug: "the-martian",
      year: nil,
      isbn13: "978-0553418026",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Mastering Bitcoin",
      sortable_title: "mastering bitcoin",
      slug: "mastering-bitcoin",
      year: 2014,
      isbn13: "9781491902646",
      purchase_url: nil,
      category: "Technical"
    },
    %{
      title: "Mastermind: How to Think Like Sherlock Holmes",
      sortable_title: "mastermind: how to think like sherlock holmes",
      slug: "mastermind-how-to-think-like-sherlock-holmes",
      year: nil,
      isbn13: "9780670026579",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Maul",
      sortable_title: "maul",
      slug: "maul",
      year: nil,
      isbn13: "978-1597800372",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Meditations",
      sortable_title: "meditations",
      slug: "meditations",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Memoirs of a Geisha",
      sortable_title: "memoirs of a geisha",
      slug: "memoirs-of-a-geisha",
      year: 1997,
      isbn13: "9780679781585",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Men Explain Things to Me",
      sortable_title: "men explain things to me",
      slug: "men-explain-things-to-me",
      year: 2014,
      isbn13: "9781608464661",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Men Without Women",
      sortable_title: "men without women",
      slug: "men-without-women",
      year: 2014,
      isbn13: "9781101974520",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "The Millionaire Next Door: The Surprising Secrets of Americas Wealthy ",
      sortable_title: "millionaire next door: the surprising secrets of americas wealthy ",
      slug: "the-millionaire-next-door-the-surprising-secrets-of-americas-wealthy",
      year: 1996,
      isbn13: "9780671015206",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Mindfulness for Beginners",
      sortable_title: "mindfulness for beginners",
      slug: "mindfulness-for-beginners",
      year: 2016,
      isbn13: "9781622036677",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Mockingjay",
      sortable_title: "mockingjay",
      slug: "mockingjay",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Money Book for Freelancers",
      sortable_title: "money book for freelancers",
      slug: "the-money-book-for-freelancers",
      year: nil,
      isbn13: "978-0307453662",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Mongoliad",
      sortable_title: "mongoliad",
      slug: "the-mongoliad",
      year: nil,
      isbn13: "978-1612182360",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Mongoliad Book three",
      sortable_title: "mongoliad book three",
      slug: "the-mongoliad-book-three",
      year: 2013,
      isbn13: "9781612182384",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "The Mongoliad Book Two",
      sortable_title: "mongoliad book two",
      slug: "the-mongoliad-book-two",
      year: nil,
      isbn13: "978-1612182377",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Murder on the Orient Express",
      sortable_title: "murder on the orient express",
      slug: "murder-on-the-orient-express",
      year: 1934,
      isbn13: "9780062073495",
      purchase_url:
        "http://www.powells.com/book/murder-on-the-orient-express-a-hercule-poirot-mystery-9780062073495/2-4",
      category: "Fiction"
    },
    %{
      title: "The Mysterious Affair At Styles",
      sortable_title: "mysterious affair at styles",
      slug: "the-mysterious-affair-at-styles",
      year: 1920,
      isbn13: "9780007119271",
      purchase_url: "http://www.powells.com/book/mysterious-affair-at-styles-9780007119271/68-1",
      category: "Fiction"
    },
    %{
      title: "The Mythical Man-Month",
      sortable_title: "mythical man-month",
      slug: "the-mythical-man-month",
      year: nil,
      isbn13: "9780201835953",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Naked in Death",
      sortable_title: "naked in death",
      slug: "naked-in-death",
      year: nil,
      isbn13: "978-0425148297",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Name of the Devil",
      sortable_title: "name of the devil",
      slug: "name-of-the-devil",
      year: nil,
      isbn13: "978-0062348890",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Napoleon Bonaparte: A Life",
      sortable_title: "napoleon bonaparte: a life",
      slug: "napoleon-bonaparte-a-life",
      year: nil,
      isbn13: "978-0060172145",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Naturalist",
      sortable_title: "naturalist",
      slug: "the-naturalist",
      year: 2017,
      isbn13: "9781477824245",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Never Let Me Go",
      sortable_title: "never let me go",
      slug: "never-let-me-go",
      year: 2005,
      isbn13: "9780571272136",
      purchase_url: "http://www.powells.com/book/never-let-me-go-9781400078776/18-0",
      category: "Fiction"
    },
    %{
      title: "Neverwhere",
      sortable_title: "neverwhere",
      slug: "neverwhere",
      year: nil,
      isbn13: "978-0060557812",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The New Father",
      sortable_title: "new father",
      slug: "the-new-father",
      year: 2015,
      isbn13: "9780789211774",
      purchase_url:
        "http://www.powells.com/book/new-father-2nd-edition-dads-guide-to-the-first-year-9780789208156/7-4",
      category: "Non-Fiction"
    },
    %{
      title: "Nothing Like it in the World",
      sortable_title: "nothing like it in the world",
      slug: "nothing-like-it-in-the-world",
      year: nil,
      isbn13: "978-0743203173",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Obstacle is the Way",
      sortable_title: "obstacle is the way",
      slug: "the-obstacle-is-the-way",
      year: 2014,
      isbn13: "9781591846352",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Oil!",
      sortable_title: "oil!",
      slug: "oil",
      year: 1927,
      isbn13: "9780143112266",
      purchase_url: "http://www.powells.com/book/oil-9780143112266/17-41",
      category: "Fiction"
    },
    %{
      title: "The Old Man and the Sea",
      sortable_title: "old man and the sea",
      slug: "the-old-man-and-the-sea",
      year: 1952,
      isbn13: "0-684-80122-1",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Olympos",
      sortable_title: "olympos",
      slug: "olympos",
      year: nil,
      isbn13: "978-0380817931",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Omnivore’s Dilemma",
      sortable_title: "omnivore’s dilemma",
      slug: "the-omnivores-dilemma",
      year: nil,
      isbn13: "978-0143038580",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "On Basilisk Station",
      sortable_title: "on basilisk station",
      slug: "on-basilisk-station",
      year: nil,
      isbn13: "978-0743435710",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "On Top of the World",
      sortable_title: "on top of the world",
      slug: "on-top-of-the-world",
      year: nil,
      isbn13: "60510307",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Outliers",
      sortable_title: "outliers",
      slug: "outliers",
      year: nil,
      isbn13: "978-0316017923",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Pale Horseman",
      sortable_title: "pale horseman",
      slug: "the-pale-horseman",
      year: nil,
      isbn13: "978-0061144837",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Paradox of Choice: Why More Is Less",
      sortable_title: "paradox of choice: why more is less",
      slug: "the-paradox-of-choice-why-more-is-less",
      year: nil,
      isbn13: "978-0060005696",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Perelandra",
      sortable_title: "perelandra",
      slug: "perelandra",
      year: nil,
      isbn13: "978-0743234917",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Phoenix in Action",
      sortable_title: "phoenix in action",
      slug: "phoenix-in-action",
      year: 2018,
      isbn13: "9781617295041",
      purchase_url: nil,
      category: "Technical"
    },
    %{
      title: "Pinball 1973",
      sortable_title: "pinball 1973",
      slug: "pinball-1973",
      year: nil,
      isbn13: "9784061860124",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Portland Noir",
      sortable_title: "portland noir",
      slug: "portland-noir",
      year: 2009,
      isbn13: "9781933354798 ",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Portnoy's Complaint",
      sortable_title: "portnoy's complaint",
      slug: "portnoys-complaint",
      year: 1969,
      isbn13: "9780679756453",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "PostgreSQL Up & Running",
      sortable_title: "postgresql up & running",
      slug: "postgresql-up-running",
      year: 2015,
      isbn13: "9781449373191",
      purchase_url: nil,
      category: "Technical"
    },
    %{
      title: "Practical Object Oriented Design in Ruby",
      sortable_title: "practical object oriented design in ruby",
      slug: "practical-object-oriented-design-in-ruby",
      year: 2012,
      isbn13: "9780321721334",
      purchase_url: nil,
      category: "Technical"
    },
    %{
      title: "Presto!: How I Made Over 100 Pounds Disappear and Other Magical Tales",
      sortable_title: "presto!: how i made over 100 pounds disappear and other magical tales",
      slug: "presto-how-i-made-over-100-pounds-disappear-and-other-magical-tales",
      year: 2016,
      isbn13: "9781501140181",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Prey",
      sortable_title: "prey",
      slug: "prey",
      year: nil,
      isbn13: "978-0060872984",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Programming Phoenix 1.4",
      sortable_title: "programming phoenix 1.4",
      slug: "programming-phoenix-14",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Technical"
    },
    %{
      title: "Proust was a Neuroscientist",
      sortable_title: "proust was a neuroscientist",
      slug: "proust-was-a-neuroscientist",
      year: nil,
      isbn13: "978-0547085906",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Public Radio Behind The Voices",
      sortable_title: "public radio behind the voices",
      slug: "public-radio-behind-the-voices",
      year: 2006,
      isbn13: "9781593151430",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Quicksilver",
      sortable_title: "quicksilver",
      slug: "quicksilver",
      year: 2003,
      isbn13: "9780380977420",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Quiet: The Power of Introverts in a World That Can't Stop Talking",
      sortable_title: "quiet: the power of introverts in a world that can't stop talking",
      slug: "quiet-the-power-of-introverts-in-a-world-that-cant-stop-talking",
      year: nil,
      isbn13: "978-0307352156",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Rabbit Run",
      sortable_title: "rabbit run",
      slug: "rabbit-run",
      year: nil,
      isbn13: "978-0449911655",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Reading Portland",
      sortable_title: "reading portland",
      slug: "reading-portland",
      year: 2007,
      isbn13: "9780295986777",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Ready Player One",
      sortable_title: "ready player one",
      slug: "ready-player-one",
      year: nil,
      isbn13: "978-0307887443",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Reality Dysfunction, Part 1",
      sortable_title: "reality dysfunction, part 1",
      slug: "the-reality-dysfunction-part-1",
      year: nil,
      isbn13: "978-0446605151",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Reality Dysfunction, Part 2",
      sortable_title: "reality dysfunction, part 2",
      slug: "the-reality-dysfunction-part-2",
      year: nil,
      isbn13: "978-0446605168",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Reamde",
      sortable_title: "reamde",
      slug: "reamde",
      year: nil,
      isbn13: "978-0061977961",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Red Dragon",
      sortable_title: "red dragon",
      slug: "red-dragon",
      year: nil,
      isbn13: "978-0425228227",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Red Notice",
      sortable_title: "red notice",
      slug: "red-notice",
      year: nil,
      isbn13: "978-1476755717",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Remains of the Day",
      sortable_title: "remains of the day",
      slug: "remains-of-the-day",
      year: 1989,
      isbn13: "9780679731726",
      purchase_url: "http://www.powells.com/book/the-remains-of-the-day-9780679731726/7-8",
      category: "Fiction"
    },
    %{
      title: "Reminiscences of a Stock Operator",
      sortable_title: "reminiscences of a stock operator",
      slug: "reminiscences-of-a-stock-operator",
      year: 1923,
      isbn13: "9780471059707",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Republic Lost",
      sortable_title: "republic lost",
      slug: "republic-lost",
      year: 2015,
      isbn13: "9781455537013",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Rewind Files",
      sortable_title: "rewind files",
      slug: "the-rewind-files",
      year: 2015,
      isbn13: "9780986115745",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Rich Dad Poor Dad",
      sortable_title: "rich dad poor dad",
      slug: "rich-dad-poor-dad",
      year: 1997,
      isbn13: "9780446677455",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Richest Man in Babylon",
      sortable_title: "richest man in babylon",
      slug: "the-richest-man-in-babylon",
      year: 1926,
      isbn13: "9780452267251",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "The Righteous Mind",
      sortable_title: "righteous mind",
      slug: "the-righteous-mind",
      year: 2013,
      isbn13: "9780307455772",
      purchase_url:
        "http://www.powells.com/book/righteous-mind-why-good-people-are-divided-by-politics-religion-9780307455772/62-0",
      category: "Non-Fiction"
    },
    %{
      title: "The Right Stuff",
      sortable_title: "right stuff",
      slug: "the-right-stuff",
      year: nil,
      isbn13: "978-0312427566",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Rise and Fall of DODO",
      sortable_title: "rise and fall of dodo",
      slug: "the-rise-and-fall-of-dodo",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "The Rise and Fall of the Third Reich",
      sortable_title: "rise and fall of the third reich",
      slug: "the-rise-and-fall-of-the-third-reich",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "A River in Darkness",
      sortable_title: "river in darkness",
      slug: "a-river-in-darkness",
      year: 2018,
      isbn13: "9781503936904",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "The Road",
      sortable_title: "road",
      slug: "the-road",
      year: nil,
      isbn13: "978-0307387899",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Road to Little Dribbling",
      sortable_title: "road to little dribbling",
      slug: "the-road-to-little-dribbling",
      year: 2016,
      isbn13: "9780804172714",
      purchase_url: "http://www.powells.com/book/the-road-to-little-dribbling-9780804172714/17-0",
      category: "Non-Fiction"
    },
    %{
      title: "Robert Oppenheimer: A Life Inside the Center",
      sortable_title: "robert oppenheimer: a life inside the center",
      slug: "robert-oppenheimer-a-life-inside-the-center",
      year: 2014,
      isbn13: "9780385722049",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "The Rust Programming Language",
      sortable_title: "rust programming language",
      slug: "the-rust-programming-language",
      year: 2018,
      isbn13: "9781593278281",
      purchase_url: nil,
      category: "Technical"
    },
    %{
      title: "Scaling Up Excellence",
      sortable_title: "scaling up excellence",
      slug: "scaling-up-excellence",
      year: 2014,
      isbn13: "9780385347020",
      purchase_url:
        "http://www.powells.com/book/scaling-up-excellence-getting-to-more-without-settling-for-less-9780385347020/2-2",
      category: "Non-Fiction"
    },
    %{
      title: "Scottsboro",
      sortable_title: "scottsboro",
      slug: "scottsboro",
      year: nil,
      isbn13: "978-0393333527",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Secondhand Time",
      sortable_title: "secondhand time",
      slug: "secondhand-time",
      year: 2013,
      isbn13: "9780399588808",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "The Second Objective",
      sortable_title: "second objective",
      slug: "the-second-objective",
      year: nil,
      isbn13: "1401309526",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Seven Databases in Seven Weeks",
      sortable_title: "seven databases in seven weeks",
      slug: "seven-databases-in-seven-weeks",
      year: 2012,
      isbn13: "9781934356920",
      purchase_url: nil,
      category: "Technical"
    },
    %{
      title: "Seveneves",
      sortable_title: "seveneves",
      slug: "seveneves",
      year: nil,
      isbn13: "978-0062190376",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Sky is Not the Limit",
      sortable_title: "sky is not the limit",
      slug: "the-sky-is-not-the-limit",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Snowcrash",
      sortable_title: "snowcrash",
      slug: "snowcrash",
      year: nil,
      isbn13: "978-0553380958",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Snows of Kilimanjaro",
      sortable_title: "snows of kilimanjaro",
      slug: "the-snows-of-kilimanjaro",
      year: 1938,
      isbn13: "9780684804446",
      purchase_url: "http://www.powells.com/book/snows-of-kilimanjaro-9780684804446/1-4",
      category: "Fiction"
    },
    %{
      title: "Some Remarks",
      sortable_title: "some remarks",
      slug: "some-remarks",
      year: nil,
      isbn13: "978-0062024435",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Soul of a Citizen",
      sortable_title: "soul of a citizen",
      slug: "soul-of-a-citizen",
      year: 2010,
      isbn13: "9781429934077",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "A Spell for Chameleon",
      sortable_title: "spell for chameleon",
      slug: "a-spell-for-chameleon",
      year: nil,
      isbn13: "978-0345347534",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Spirituality of Imperfection",
      sortable_title: "spirituality of imperfection",
      slug: "the-spirituality-of-imperfection",
      year: nil,
      isbn13: "978-0553371321",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "State of Fear",
      sortable_title: "state of fear",
      slug: "state-of-fear",
      year: nil,
      isbn13: "978-0061782664",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Stillness is the Key",
      sortable_title: "stillness is the key",
      slug: "stillness-is-the-key",
      year: 2019,
      isbn13: "9780525538585",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Stranger in a Strange Land",
      sortable_title: "stranger in a strange land",
      slug: "stranger-in-a-strange-land",
      year: nil,
      isbn13: "978-0441788385",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Strong Fathers, Strong Daughters",
      sortable_title: "strong fathers, strong daughters",
      slug: "strong-fathers-strong-daughters",
      year: 2007,
      isbn13: "9780345499394",
      purchase_url:
        "http://www.powells.com/book/strong-fathers-strong-daughters-10-secrets-every-father-should-know-9780345499394/17-1",
      category: "Non-Fiction"
    },
    %{
      title: "Stubborn Attachments",
      sortable_title: "stubborn attachments",
      slug: "stubborn-attachments",
      year: 2018,
      isbn13: "9781732265134",
      purchase_url: nil,
      category: "Non-Ficton"
    },
    %{
      title: "Sword Song",
      sortable_title: "sword song",
      slug: "sword-song",
      year: nil,
      isbn13: "978-0061379741",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Symphony for the City of the Dead: Dmitri Shostakovich and the Siege of Leningrad",
      sortable_title:
        "symphony for the city of the dead: dmitri shostakovich and the siege of leningrad",
      slug: "symphony-for-the-city-of-the-dead-dmitri-shostakovich-and-the-siege-of-leningrad",
      year: 2015,
      isbn13: "9780763668181",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The System of the World",
      sortable_title: "system of the world",
      slug: "the-system-of-the-world",
      year: 2004,
      isbn13: "9780060523879 ",
      purchase_url:
        "http://www.powells.com/book/system-of-the-world-baroque-cycle-3-9780060523879/17-7",
      category: "Fiction"
    },
    %{
      title: "Tesla: Man Out of Time",
      sortable_title: "tesla: man out of time",
      slug: "tesla-man-out-of-time",
      year: nil,
      isbn13: "978-0743215367",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "That Hideous Strength",
      sortable_title: "that hideous strength",
      slug: "that-hideous-strength",
      year: nil,
      isbn13: "978-0684823850",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Timeline",
      sortable_title: "timeline",
      slug: "timeline",
      year: nil,
      isbn13: "978-0345517814",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Tipping Point",
      sortable_title: "tipping point",
      slug: "the-tipping-point",
      year: nil,
      isbn13: "978-0316346627",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Tmux 2: Productive Mouse-Free Development",
      sortable_title: "tmux 2: productive mouse-free development",
      slug: "tmux-2-productive-mouse-free-development",
      year: 2016,
      isbn13: "9781680502213",
      purchase_url: nil,
      category: "Technical"
    },
    %{
      title: "To Have and Have Not",
      sortable_title: "to have and have not",
      slug: "to-have-and-have-not",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "Unbroken",
      sortable_title: "unbroken",
      slug: "unbroken",
      year: nil,
      isbn13: "978-1400064168",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title:
        "Undaunted Courage Meriwether Lewis Thomas Jefferson & the Opening of the American West ",
      sortable_title:
        "undaunted courage meriwether lewis thomas jefferson & the opening of the american west ",
      slug:
        "undaunted-courage-meriwether-lewis-thomas-jefferson-the-opening-of-the-american-west",
      year: 1997,
      isbn13: "9780684826974",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "VB6",
      sortable_title: "vb6",
      slug: "vb6",
      year: nil,
      isbn13: "978-0385344746",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "A Visit from the Goon Squad",
      sortable_title: "visit from the goon squad",
      slug: "a-visit-from-the-goon-squad",
      year: nil,
      isbn13: "978-0307592835",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Watchmen",
      sortable_title: "watchmen",
      slug: "the-watchmen",
      year: nil,
      isbn13: "978-0930289232",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Water for Elephants",
      sortable_title: "water for elephants",
      slug: "water-for-elephants",
      year: nil,
      isbn13: "978-1565125605",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Where the Red Fern Grows",
      sortable_title: "where the red fern grows",
      slug: "where-the-red-fern-grows",
      year: nil,
      isbn13: "978-0440412670",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "A Wild Sheep Chase",
      sortable_title: "wild sheep chase",
      slug: "a-wild-sheep-chase",
      year: 1982,
      isbn13: "9780375718946",
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "The Wind-Up Bird Chronicle",
      sortable_title: "wind-up bird chronicle",
      slug: "the-wind-up-bird-chronicle",
      year: nil,
      isbn13: nil,
      purchase_url: nil,
      category: "Fiction"
    },
    %{
      title: "The World According to Garp",
      sortable_title: "world according to garp",
      slug: "the-world-according-to-garp",
      year: nil,
      isbn13: "978-0345366764",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "World Without End",
      sortable_title: "world without end",
      slug: "world-without-end",
      year: nil,
      isbn13: "978-0451228376",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Year of the King",
      sortable_title: "year of the king",
      slug: "year-of-the-king",
      year: nil,
      isbn13: "978-0879103354",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Zen Programmer",
      sortable_title: "zen programmer",
      slug: "the-zen-programmer",
      year: 2013,
      isbn13: "978-1493541799",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Ziegfeld: The Man Who Invented Show Business",
      sortable_title: "ziegfeld: the man who invented show business",
      slug: "ziegfeld-the-man-who-invented-show-business",
      year: nil,
      isbn13: "312375433",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "Zodiac",
      sortable_title: "zodiac",
      slug: "zodiac",
      year: nil,
      isbn13: "978-0802143150",
      purchase_url: nil,
      category: "Non-Fiction"
    },
    %{
      title: "The Zombie Survival Guide",
      sortable_title: "zombie survival guide",
      slug: "the-zombie-survival-guide",
      year: 2003,
      isbn13: "9781400049622",
      purchase_url: nil,
      category: "Fiction"
    }
  ]

  @authorship_data [
    %{book_slug: "1491", author_slug: "charles-c-mann"},
    %{book_slug: "1984", author_slug: "george-orwell"},
    %{book_slug: "1q84", author_slug: "haruki-murakami"},
    %{book_slug: "a-brief-history-of-time", author_slug: "stephen-hawking"},
    %{book_slug: "a-confederacy-of-dunces", author_slug: "john-kennedy-toole"},
    %{book_slug: "a-connecticut-yankee-in-king-arthurs-court", author_slug: "mark-twain"},
    %{book_slug: "across-the-river-and-into-the-trees", author_slug: "ernest-hemingway"},
    %{book_slug: "alan-turning-the-enigma", author_slug: "andrew-hodges"},
    %{book_slug: "altered-carbon", author_slug: "richard-k-morgan"},
    %{book_slug: "american-gods", author_slug: "neil-gaiman"},
    %{book_slug: "american-on-purpose", author_slug: "craig-ferguson"},
    %{book_slug: "anansi-boys", author_slug: "neil-gaiman"},
    %{book_slug: "angelas-ashes", author_slug: "frank-mccourt"},
    %{book_slug: "angel-killer", author_slug: "andrew-mayne"},
    %{book_slug: "a-river-in-darkness", author_slug: "masaji-ishikawa"},
    %{book_slug: "a-spell-for-chameleon", author_slug: "piers-anthony"},
    %{book_slug: "a-visit-from-the-goon-squad", author_slug: "jennifer-egan"},
    %{book_slug: "a-wild-sheep-chase", author_slug: "haruki-murakami"},
    %{book_slug: "between-the-world-and-me", author_slug: "ta-nehisi-coates"},
    %{book_slug: "blink", author_slug: "malcolm-gladwell"},
    %{book_slug: "blood-bones-and-butter", author_slug: "gabrielle-hamilton"},
    %{book_slug: "blood-merridian", author_slug: "cormac-mccarthy"},
    %{book_slug: "caring-discipline", author_slug: "joanne-nordling"},
    %{book_slug: "catching-fire", author_slug: "suzanne-collins"},
    %{book_slug: "churchill", author_slug: "paul-johnson"},
    %{book_slug: "cloud-atlas", author_slug: "david-mitchell"},
    %{book_slug: "cloud-native-go", author_slug: "dan-nemeth"},
    %{book_slug: "cloud-native-go", author_slug: "kevin-hoffman"},
    %{book_slug: "cobweb", author_slug: "neal-stephenson"},
    %{book_slug: "code", author_slug: "charles-petzold"},
    %{book_slug: "confessions-of-an-economic-hitman", author_slug: "john-perkins"},
    %{book_slug: "coraline", author_slug: "neil-gaiman"},
    %{book_slug: "corellis-mandolin", author_slug: "louis-de-bernieres"},
    %{book_slug: "cryptonomicon", author_slug: "neal-stephenson"},
    %{book_slug: "cutting-for-stone", author_slug: "abraham-verghese"},
    %{book_slug: "daemon", author_slug: "daniel-suarez"},
    %{book_slug: "dance-dance-dance", author_slug: "haruki-murakami"},
    %{book_slug: "destiny-of-the-republic", author_slug: "candice-millard"},
    %{book_slug: "devil-in-the-white-city", author_slug: "erik-larson"},
    %{book_slug: "digital-minimalism", author_slug: "cal-newport"},
    %{book_slug: "dirk-gentlys-holistic-detective-agency", author_slug: "douglas-adams"},
    %{book_slug: "disclosure", author_slug: "michael-crichton"},
    %{book_slug: "docker-for-php-developers", author_slug: "paul-redmond"},
    %{book_slug: "dreamland", author_slug: "sam-quinones"},
    %{book_slug: "dreams-from-my-father", author_slug: "barack-obama"},
    %{book_slug: "dune", author_slug: "frank-herbert"},
    %{book_slug: "early-portland-stump-town-triumphant", author_slug: "eugene-e-snyder"},
    %{book_slug: "eat-to-live", author_slug: "joel-fuhrman"},
    %{book_slug: "effective-devops", author_slug: "katherine-daniels"},
    %{book_slug: "effective-devops", author_slug: "jennifer-davis"},
    %{book_slug: "ego-is-the-enemy", author_slug: "ryan-holiday"},
    %{book_slug: "einstein-his-life-and-universe", author_slug: "walter-isaacson"},
    %{book_slug: "elixir-in-action", author_slug: "sasa-juric"},
    %{
      book_slug: "elon-musk-tesla-spacex-and-the-quest-for-a-fantastic-future",
      author_slug: "ashlee-vance"
    },
    %{book_slug: "enlightenment-now", author_slug: "steven-pinker"},
    %{book_slug: "everyday-blessings", author_slug: "jon-kabat-zinn"},
    %{book_slug: "everyday-blessings", author_slug: "myla-kabat-zinn"},
    %{book_slug: "factfulness", author_slug: "hans-rosling"},
    %{book_slug: "fight-club", author_slug: "chuck-palahniuk"},
    %{book_slug: "filters-against-folly", author_slug: "garrett-hardin"},
    %{book_slug: "fire-at-edens-gate", author_slug: "brent-walth"},
    %{book_slug: "food-matters", author_slug: "mark-bittman"},
    %{book_slug: "fooling-houdini", author_slug: "alex-stone"},
    %{book_slug: "for-us-the-living", author_slug: "robert-heinlein"},
    %{book_slug: "for-whom-the-bell-tolls", author_slug: "ernest-hemingway"},
    %{book_slug: "foucaults-pendulum", author_slug: "umberto-eco"},
    %{book_slug: "freedom-tm", author_slug: "daniel-suarez"},
    %{
      book_slug: "fugitives-and-refugees-a-walk-in-portland-oregon",
      author_slug: "chuck-palahniuk"
    },
    %{book_slug: "full-catastrophe-living", author_slug: "jon-kabat-zinn"},
    %{book_slug: "game-of-thrones", author_slug: "george-rr-martin"},
    %{book_slug: "ghost-in-the-wires", author_slug: "kevin-mitnick"},
    %{
      book_slug: "gods-wasps-stranglers-the-secret-history-redemptive-future-of-fig-trees",
      author_slug: "mike-shanahan"
    },
    %{
      book_slug: "going-clear-scientology-hollywood-and-the-prison-of-belief",
      author_slug: "lawrence-wright"
    },
    %{book_slug: "good-days-and-mad", author_slug: "dick-debartolo"},
    %{book_slug: "green-hills-of-africa", author_slug: "ernest-hemingway"},
    %{book_slug: "hallelujah-junction", author_slug: "john-adams"},
    %{book_slug: "hardcore-zen", author_slug: "brad-warner"},
    %{book_slug: "hardwired", author_slug: "walter-jon-williams"},
    %{book_slug: "harry-potter-and-the-deathly-hallows", author_slug: "jk-rowling"},
    %{book_slug: "harry-potter-and-the-half-blood-prince", author_slug: "jk-rowling"},
    %{book_slug: "hear-the-wind-sing", author_slug: "haruki-murakami"},
    %{book_slug: "hidden-figures", author_slug: "margot-lee-shetterly"},
    %{book_slug: "hillbilly-elegy", author_slug: "jd-vance"},
    %{book_slug: "hitch-22", author_slug: "christopher-hitchens"},
    %{book_slug: "how-the-irish-saved-civilization", author_slug: "thomas-cahill"},
    %{book_slug: "how-toddlers-thrive", author_slug: "tovah-p-klein"},
    %{book_slug: "how-we-got-to-now", author_slug: "stephen-johnson"},
    %{book_slug: "http2-in-action", author_slug: "barry-pollard"},
    %{book_slug: "hybrid", author_slug: "noel-kingsbury"},
    %{book_slug: "if-chins-could-kill", author_slug: "bruce-campbell"},
    %{book_slug: "ilium", author_slug: "dan-simmons"},
    %{book_slug: "i-love-books", author_slug: "john-d-snider"},
    %{book_slug: "interface", author_slug: "neal-stephenson"},
    %{book_slug: "in-the-garden-of-beasts", author_slug: "erik-larson"},
    %{book_slug: "introducing-elixir", author_slug: "simon-st-laurent"},
    %{book_slug: "introducing-elixir", author_slug: "j-david-eisenberg"},
    %{book_slug: "introducing-go", author_slug: "caleb-doxsey"},
    %{book_slug: "joe-papp-an-american-life", author_slug: "helen-epstein"},
    %{book_slug: "killers-of-the-flower-moon", author_slug: "david-grann"},
    %{book_slug: "kitchen-confidential", author_slug: "anthony-bourdain"},
    %{book_slug: "letters-to-a-young-contrarian", author_slug: "christopher-hitchens"},
    %{book_slug: "lincoln", author_slug: "david-herbert-donald"},
    %{book_slug: "linux-pocket-guide", author_slug: "daniel-j-barrett"},
    %{book_slug: "listening-is-an-act-of-love", author_slug: "dave-isay"},
    %{book_slug: "literary-brooklyn", author_slug: "evan-hughes"},
    %{book_slug: "little-brother", author_slug: "cory-doctorow"},
    %{book_slug: "lords-of-the-north", author_slug: "bernard-cornwell"},
    %{book_slug: "lovecraft-country", author_slug: "matt-ruff"},
    %{book_slug: "madame-curie-a-biography", author_slug: "eve-curie"},
    %{book_slug: "mans-search-for-meaning", author_slug: "viktor-e-frankl"},
    %{book_slug: "mastering-bitcoin", author_slug: "andreas-m-antonopoulos"},
    %{book_slug: "mastermind-how-to-think-like-sherlock-holmes", author_slug: "maria-konnikova"},
    %{book_slug: "maul", author_slug: "tricia-sullivan"},
    %{book_slug: "meditations", author_slug: "marcus-aurelius"},
    %{book_slug: "memoirs-of-a-geisha", author_slug: "arthur-golden"},
    %{book_slug: "men-explain-things-to-me", author_slug: "rebecca-solnit"},
    %{book_slug: "men-without-women", author_slug: "haruki-murakami"},
    %{book_slug: "mindfulness-for-beginners", author_slug: "jon-kabat-zinn"},
    %{book_slug: "mockingjay", author_slug: "suzanne-collins"},
    %{book_slug: "murder-on-the-orient-express", author_slug: "agatha-christie"},
    %{book_slug: "naked-in-death", author_slug: "j-d-robb"},
    %{book_slug: "name-of-the-devil", author_slug: "andrew-mayne"},
    %{book_slug: "napoleon-bonaparte-a-life", author_slug: "alan-schom"},
    %{book_slug: "never-let-me-go", author_slug: "kazuo-ishiguro"},
    %{book_slug: "neverwhere", author_slug: "neil-gaiman"},
    %{book_slug: "nothing-like-it-in-the-world", author_slug: "stephen-e-ambrose"},
    %{book_slug: "oil", author_slug: "upton-sinclair"},
    %{book_slug: "olympos", author_slug: "dan-simmons"},
    %{book_slug: "on-basilisk-station", author_slug: "david-weber"},
    %{book_slug: "on-top-of-the-world", author_slug: "tom-barbash"},
    %{book_slug: "outliers", author_slug: "malcolm-gladwell"},
    %{book_slug: "perelandra", author_slug: "cs-lewis"},
    %{book_slug: "phoenix-in-action", author_slug: "geoffrey-lessel"},
    %{book_slug: "pinball-1973", author_slug: "haruki-murakami"},
    %{book_slug: "portland-noir", author_slug: "kevin-sampsell"},
    %{book_slug: "portnoys-complaint", author_slug: "philip-roth"},
    %{book_slug: "postgresql-up-running", author_slug: "leo-hsu"},
    %{book_slug: "postgresql-up-running", author_slug: "regina-obe"},
    %{book_slug: "practical-object-oriented-design-in-ruby", author_slug: "sandi-metz"},
    %{
      book_slug: "presto-how-i-made-over-100-pounds-disappear-and-other-magical-tales",
      author_slug: "penn-jillette"
    },
    %{book_slug: "prey", author_slug: "michael-crichton"},
    %{book_slug: "programming-phoenix-14", author_slug: "chris-mccord"},
    %{book_slug: "programming-phoenix-14", author_slug: "jose-valim"},
    %{book_slug: "programming-phoenix-14", author_slug: "bruce-tate"},
    %{book_slug: "proust-was-a-neuroscientist", author_slug: "jonah-lehrer"},
    %{book_slug: "public-radio-behind-the-voices", author_slug: "lisa-a-phillips"},
    %{book_slug: "quicksilver", author_slug: "neal-stephenson"},
    %{
      book_slug: "quiet-the-power-of-introverts-in-a-world-that-cant-stop-talking",
      author_slug: "susan-cain"
    },
    %{book_slug: "rabbit-run", author_slug: "john-updike"},
    %{book_slug: "reading-portland", author_slug: "john-trombold"},
    %{book_slug: "ready-player-one", author_slug: "ernest-cline"},
    %{book_slug: "reamde", author_slug: "neal-stephenson"},
    %{book_slug: "red-dragon", author_slug: "thomas-harris"},
    %{book_slug: "red-notice", author_slug: "bill-browder"},
    %{book_slug: "remains-of-the-day", author_slug: "kazuo-ishiguro"},
    %{book_slug: "reminiscences-of-a-stock-operator", author_slug: "edwin-lefevre"},
    %{book_slug: "republic-lost", author_slug: "lawrence-lessig"},
    %{book_slug: "rich-dad-poor-dad", author_slug: "robert-kiyosaki"},
    %{book_slug: "robert-oppenheimer-a-life-inside-the-center", author_slug: "ray-monk"},
    %{book_slug: "scaling-up-excellence", author_slug: "robert-i-sutton"},
    %{book_slug: "scaling-up-excellence", author_slug: "huggy-rao"},
    %{book_slug: "scottsboro", author_slug: "ellen-feldman"},
    %{book_slug: "secondhand-time", author_slug: "svetlana-alexievich"},
    %{book_slug: "seven-databases-in-seven-weeks", author_slug: "eric-redmond"},
    %{book_slug: "seven-databases-in-seven-weeks", author_slug: "luc-perkins"},
    %{book_slug: "seven-databases-in-seven-weeks", author_slug: "jim-r-wilson"},
    %{book_slug: "seveneves", author_slug: "neal-stephenson"},
    %{book_slug: "snowcrash", author_slug: "neal-stephenson"},
    %{book_slug: "some-remarks", author_slug: "neal-stephenson"},
    %{book_slug: "soul-of-a-citizen", author_slug: "paul-rogat-loeb"},
    %{book_slug: "state-of-fear", author_slug: "michael-crichton"},
    %{book_slug: "stillness-is-the-key", author_slug: "ryan-holiday"},
    %{book_slug: "stranger-in-a-strange-land", author_slug: "robert-heinlein"},
    %{book_slug: "strong-fathers-strong-daughters", author_slug: "meg-meeker"},
    %{book_slug: "stubborn-attachments", author_slug: "tyler-cowen"},
    %{book_slug: "sword-song", author_slug: "bernard-cornwell"},
    %{
      book_slug:
        "symphony-for-the-city-of-the-dead-dmitri-shostakovich-and-the-siege-of-leningrad",
      author_slug: "mt-anderson"
    },
    %{book_slug: "tesla-man-out-of-time", author_slug: "margaret-cheney"},
    %{book_slug: "that-hideous-strength", author_slug: "cs-lewis"},
    %{book_slug: "the-alienist", author_slug: "caleb-carr"},
    %{book_slug: "the-almost-moon", author_slug: "alice-sebold"},
    %{book_slug: "the-better-angels-of-our-nature", author_slug: "steven-pinker"},
    %{book_slug: "the-big-u", author_slug: "neal-stephenson"},
    %{book_slug: "the-cider-house-rules", author_slug: "john-irving"},
    %{book_slug: "the-complete-sherlock-holmes", author_slug: "arthur-conan-doyle"},
    %{book_slug: "the-confusion", author_slug: "neal-stephenson"},
    %{book_slug: "the-demon-haunted-world", author_slug: "carl-sagan"},
    %{book_slug: "the-diamond-age", author_slug: "neal-stephenson"},
    %{book_slug: "the-difference-engine", author_slug: "william-gibson"},
    %{book_slug: "the-elements-of-style", author_slug: "william-strunk-jr"},
    %{book_slug: "the-emperor-wears-no-clothes", author_slug: "jack-herer"},
    %{book_slug: "the-end-of-faith", author_slug: "sam-harris"},
    %{book_slug: "the-everything-store", author_slug: "brad-stone"},
    %{book_slug: "the-expectant-father", author_slug: "armin-a-brott"},
    %{book_slug: "the-expectant-father", author_slug: "jennifer-ash"},
    %{book_slug: "the-garden-of-eden", author_slug: "ernest-hemingway"},
    %{book_slug: "the-gift-of-failure", author_slug: "jessica-lahey"},
    %{book_slug: "the-girl-who-played-with-fire", author_slug: "stieg-larson"},
    %{book_slug: "the-girl-with-the-dragon-tattoo", author_slug: "stieg-larson"},
    %{book_slug: "the-golden-compass", author_slug: "phillip-pullman"},
    %{book_slug: "the-good-jobs-strategy", author_slug: "zeynep-ton"},
    %{book_slug: "the-gunslinger", author_slug: "stephen-king"},
    %{book_slug: "the-hitchhikers-guide-to-the-galaxy", author_slug: "douglas-adams"},
    %{book_slug: "the-honor-of-the-queen", author_slug: "david-weber"},
    %{book_slug: "the-hunger-games", author_slug: "suzanne-collins"},
    %{book_slug: "the-idea-factory", author_slug: "jon-gertner"},
    %{book_slug: "the-innovators", author_slug: "walter-isaacson"},
    %{book_slug: "the-internet-of-money-vol-1", author_slug: "andreas-m-antonopoulos"},
    %{book_slug: "the-internet-of-money-vol-2", author_slug: "andreas-m-antonopoulos"},
    %{book_slug: "the-japanese-mind", author_slug: "roger-j-davies"},
    %{book_slug: "the-last-kingdom", author_slug: "bernard-cornwell"},
    %{book_slug: "the-left-hand-of-darkness", author_slug: "ursula-k-le-guin"},
    %{book_slug: "the-life-of-andrew-jackson", author_slug: "marquis-james"},
    %{book_slug: "the-list-of-seven", author_slug: "mark-frost"},
    %{book_slug: "the-long-dark-tea-time-of-the-soul", author_slug: "douglas-adams"},
    %{book_slug: "the-man-in-the-high-castle", author_slug: "phillip-k-dick"},
    %{book_slug: "the-man-who-mistook-his-wife-for-a-hat", author_slug: "oliver-sacks"},
    %{book_slug: "the-martian", author_slug: "andy-weir"},
    %{
      book_slug: "the-millionaire-next-door-the-surprising-secrets-of-americas-wealthy",
      author_slug: "thomas-j-stanley"
    },
    %{book_slug: "the-money-book-for-freelancers", author_slug: "denise-kiernam"},
    %{book_slug: "the-money-book-for-freelancers", author_slug: "joseph-dagnese"},
    %{book_slug: "the-mongoliad", author_slug: "neal-stephenson"},
    %{book_slug: "the-mongoliad-book-three", author_slug: "joseph-brassey"},
    %{book_slug: "the-mongoliad-book-three", author_slug: "neal-stephenson"},
    %{book_slug: "the-mongoliad-book-three", author_slug: "erik-bear"},
    %{book_slug: "the-mongoliad-book-three", author_slug: "greg-bear"},
    %{book_slug: "the-mongoliad-book-three", author_slug: "nicole-galland"},
    %{book_slug: "the-mongoliad-book-three", author_slug: "mark-teppo"},
    %{book_slug: "the-mongoliad-book-three", author_slug: "cooper-moo"},
    %{book_slug: "the-mongoliad-book-two", author_slug: "neal-stephenson"},
    %{book_slug: "the-mongoliad-book-two", author_slug: "mark-teppo"},
    %{book_slug: "the-mongoliad-book-two", author_slug: "cooper-moo"},
    %{book_slug: "the-mongoliad-book-two", author_slug: "nicole-galland"},
    %{book_slug: "the-mongoliad-book-two", author_slug: "joseph-brassey"},
    %{book_slug: "the-mongoliad-book-two", author_slug: "greg-bear"},
    %{book_slug: "the-mongoliad-book-two", author_slug: "erik-bear"},
    %{book_slug: "the-mysterious-affair-at-styles", author_slug: "agatha-christie"},
    %{book_slug: "the-mythical-man-month", author_slug: "frederick-p-brooks"},
    %{book_slug: "the-naturalist", author_slug: "andrew-mayne"},
    %{book_slug: "the-new-father", author_slug: "armin-a-brott"},
    %{book_slug: "the-obstacle-is-the-way", author_slug: "ryan-holiday"},
    %{book_slug: "the-old-man-and-the-sea", author_slug: "ernest-hemingway"},
    %{book_slug: "the-omnivores-dilemma", author_slug: "michael-pollan"},
    %{book_slug: "the-pale-horseman", author_slug: "bernard-cornwell"},
    %{book_slug: "the-paradox-of-choice-why-more-is-less", author_slug: "barry-schwartz"},
    %{book_slug: "the-reality-dysfunction-part-1", author_slug: "peter-f-hamilton"},
    %{book_slug: "the-reality-dysfunction-part-2", author_slug: "peter-f-hamilton"},
    %{book_slug: "the-rewind-files", author_slug: "claire-willett"},
    %{book_slug: "the-richest-man-in-babylon", author_slug: "george-s-clason"},
    %{book_slug: "the-righteous-mind", author_slug: "jonathan-haidt"},
    %{book_slug: "the-right-stuff", author_slug: "tom-wolfe"},
    %{book_slug: "the-rise-and-fall-of-dodo", author_slug: "neal-stephenson"},
    %{book_slug: "the-rise-and-fall-of-dodo", author_slug: "nicole-galland"},
    %{book_slug: "the-rise-and-fall-of-the-third-reich", author_slug: "william-l-shirer"},
    %{book_slug: "the-road", author_slug: "cormac-mccarthy"},
    %{book_slug: "the-road-to-little-dribbling", author_slug: "bill-bryson"},
    %{book_slug: "the-rust-programming-language", author_slug: "carol-nichols"},
    %{book_slug: "the-rust-programming-language", author_slug: "steve-klabnik"},
    %{book_slug: "the-second-objective", author_slug: "mark-frost"},
    %{book_slug: "the-sky-is-not-the-limit", author_slug: "neil-degrasse-tyson"},
    %{book_slug: "the-snows-of-kilimanjaro", author_slug: "ernest-hemingway"},
    %{book_slug: "the-spirituality-of-imperfection", author_slug: "katherine-ketcham"},
    %{book_slug: "the-spirituality-of-imperfection", author_slug: "ernest-kurtz"},
    %{book_slug: "the-system-of-the-world", author_slug: "neal-stephenson"},
    %{book_slug: "the-tipping-point", author_slug: "malcolm-gladwell"},
    %{book_slug: "the-watchmen", author_slug: "alan-moore"},
    %{book_slug: "the-watchmen", author_slug: "dave-gibbons"},
    %{book_slug: "the-wind-up-bird-chronicle", author_slug: "haruki-murakami"},
    %{book_slug: "the-world-according-to-garp", author_slug: "john-irving"},
    %{book_slug: "the-zen-programmer", author_slug: "christian-grobmeier"},
    %{book_slug: "the-zombie-survival-guide", author_slug: "max-brooks"},
    %{book_slug: "timeline", author_slug: "michael-crichton"},
    %{book_slug: "to-have-and-have-not", author_slug: "ernest-hemingway"},
    %{book_slug: "unbroken", author_slug: "laura-hillenbrand"},
    %{
      book_slug:
        "undaunted-courage-meriwether-lewis-thomas-jefferson-the-opening-of-the-american-west",
      author_slug: "stephen-e-ambrose"
    },
    %{book_slug: "vb6", author_slug: "mark-bittman"},
    %{book_slug: "water-for-elephants", author_slug: "sara-gruen"},
    %{book_slug: "where-the-red-fern-grows", author_slug: "wilson-rawls"},
    %{book_slug: "world-without-end", author_slug: "ken-follet"},
    %{book_slug: "year-of-the-king", author_slug: "antony-sher"},
    %{book_slug: "ziegfeld-the-man-who-invented-show-business", author_slug: "ethan-mordden"},
    %{book_slug: "zodiac", author_slug: "neal-stephenson"}
  ]

  @completions [
    %{book_slug: "perelandra", completed_at: "2008-12-30 21:36:00-08"},
    %{book_slug: "the-difference-engine", completed_at: "2009-01-04 16:42:01-08"},
    %{
      book_slug: "ziegfeld-the-man-who-invented-show-business",
      completed_at: "2009-01-05 16:45:51-08"
    },
    %{book_slug: "naked-in-death", completed_at: "2009-01-06 16:49:25-08"},
    %{book_slug: "joe-papp-an-american-life", completed_at: "2009-01-07 16:52:10-08"},
    %{book_slug: "dune", completed_at: "2009-01-08 16:56:55-08"},
    %{book_slug: "listening-is-an-act-of-love", completed_at: "2009-01-31 17:06:09-08"},
    %{book_slug: "water-for-elephants", completed_at: "2009-02-01 17:10:39-08"},
    %{book_slug: "confessions-of-an-economic-hitman", completed_at: "2009-02-04 17:14:38-08"},
    %{book_slug: "ilium", completed_at: "2009-02-28 17:17:37-08"},
    %{book_slug: "proust-was-a-neuroscientist", completed_at: "2009-03-31 18:20:38-07"},
    %{book_slug: "full-catastrophe-living", completed_at: "2009-04-14 18:23:37-07"},
    %{
      book_slug: "the-man-who-mistook-his-wife-for-a-hat",
      completed_at: "2009-04-30 18:26:17-07"
    },
    %{book_slug: "good-days-and-mad", completed_at: "2009-07-31 18:29:13-07"},
    %{book_slug: "the-list-of-seven", completed_at: "2009-08-14 18:31:34-07"},
    %{book_slug: "einstein-his-life-and-universe", completed_at: "2009-09-30 18:34:26-07"},
    %{book_slug: "dreams-from-my-father", completed_at: "2009-10-02 08:52:04-07"},
    %{book_slug: "neverwhere", completed_at: "2009-10-03 08:55:47-07"},
    %{book_slug: "the-hitchhikers-guide-to-the-galaxy", completed_at: "2009-10-04 08:56:57-07"},
    %{book_slug: "red-dragon", completed_at: "2009-11-01 13:22:15-08"},
    %{book_slug: "disclosure", completed_at: "2009-11-02 13:24:19-08"},
    %{book_slug: "timeline", completed_at: "2009-11-03 13:30:24-08"},
    %{book_slug: "the-almost-moon", completed_at: "2009-11-04 13:32:39-08"},
    %{book_slug: "olympos", completed_at: "2009-12-01 13:34:35-08"},
    %{book_slug: "state-of-fear", completed_at: "2009-12-02 13:36:22-08"},
    %{book_slug: "that-hideous-strength", completed_at: "2010-01-01 14:21:58-08"},
    %{book_slug: "devil-in-the-white-city", completed_at: "2010-01-02 14:27:59-08"},
    %{book_slug: "on-basilisk-station", completed_at: "2010-02-01 14:29:27-08"},
    %{book_slug: "foucaults-pendulum", completed_at: "2010-03-01 14:31:53-08"},
    %{book_slug: "the-honor-of-the-queen", completed_at: "2010-03-02 14:34:18-08"},
    %{book_slug: "the-girl-with-the-dragon-tattoo", completed_at: "2010-04-01 15:35:24-07"},
    %{book_slug: "rabbit-run", completed_at: "2010-04-02 15:37:27-07"},
    %{book_slug: "the-reality-dysfunction-part-1", completed_at: "2010-04-03 15:40:07-07"},
    %{book_slug: "the-end-of-faith", completed_at: "2010-05-01 15:43:02-07"},
    %{book_slug: "blood-merridian", completed_at: "2010-05-02 15:45:00-07"},
    %{book_slug: "the-girl-who-played-with-fire", completed_at: "2010-06-01 15:46:35-07"},
    %{book_slug: "the-second-objective", completed_at: "2010-06-02 15:48:42-07"},
    %{book_slug: "the-golden-compass", completed_at: "2010-06-03 15:52:33-07"},
    %{book_slug: 1984, completed_at: "2010-07-02 15:57:30-07"},
    %{book_slug: "hardwired", completed_at: "2010-07-03 15:59:26-07"},
    %{
      book_slug: "a-connecticut-yankee-in-king-arthurs-court",
      completed_at: "2010-07-10 15:55:36-07"
    },
    %{book_slug: "daemon", completed_at: "2010-08-01 16:01:05-07"},
    %{book_slug: "the-reality-dysfunction-part-2", completed_at: "2010-08-02 16:03:15-07"},
    %{
      book_slug: "harry-potter-and-the-half-blood-prince",
      completed_at: "2010-09-01 16:05:15-07"
    },
    %{book_slug: "harry-potter-and-the-deathly-hallows", completed_at: "2010-09-02 16:06:58-07"},
    %{book_slug: "on-top-of-the-world", completed_at: "2010-09-03 16:08:53-07"},
    %{book_slug: "maul", completed_at: "2010-09-04 16:14:17-07"},
    %{book_slug: "the-spirituality-of-imperfection", completed_at: "2010-10-01 16:16:48-07"},
    %{book_slug: "fight-club", completed_at: "2010-10-02 16:38:11-07"},
    %{book_slug: "outliers", completed_at: "2010-10-03 16:41:18-07"},
    %{book_slug: "a-visit-from-the-goon-squad", completed_at: "2011-03-01 15:47:18-08"},
    %{book_slug: "in-the-garden-of-beasts", completed_at: "2011-09-24 16:54:47-07"},
    %{book_slug: "kitchen-confidential", completed_at: "2011-10-30 16:57:51-07"},
    %{book_slug: "reamde", completed_at: "2011-11-02 17:01:24-07"},
    %{book_slug: "world-without-end", completed_at: "2011-11-27 16:03:15-08"},
    %{book_slug: "the-hunger-games", completed_at: "2011-12-03 16:06:27-08"},
    %{book_slug: "catching-fire", completed_at: "2011-12-04 16:09:07-08"},
    %{book_slug: "mockingjay", completed_at: "2011-12-10 16:12:43-08"},
    %{book_slug: "the-road", completed_at: "2011-12-12 16:13:35-08"},
    %{book_slug: "stranger-in-a-strange-land", completed_at: "2011-12-21 16:15:30-08"},
    %{book_slug: "blood-bones-and-butter", completed_at: "2011-12-30 21:38:00-08"},
    %{book_slug: "the-omnivores-dilemma", completed_at: "2012-01-01 16:19:21-08"},
    %{book_slug: "the-watchmen", completed_at: "2012-01-31 16:21:14-08"},
    %{book_slug: "cutting-for-stone", completed_at: "2012-02-01 16:22:57-08"},
    %{book_slug: "hallelujah-junction", completed_at: "2012-02-29 16:24:56-08"},
    %{book_slug: "the-sky-is-not-the-limit", completed_at: "2012-03-01 16:27:23-08"},
    %{book_slug: "the-gunslinger", completed_at: "2012-03-31 17:29:28-07"},
    %{book_slug: "the-demon-haunted-world", completed_at: "2012-04-01 17:31:12-07"},
    %{book_slug: "destiny-of-the-republic", completed_at: "2012-04-02 17:34:43-07"},
    %{book_slug: "the-last-kingdom", completed_at: "2012-04-03 17:33:11-07"},
    %{book_slug: "a-confederacy-of-dunces", completed_at: "2012-04-04 17:38:14-07"},
    %{book_slug: "the-pale-horseman", completed_at: "2012-04-30 17:40:10-07"},
    %{book_slug: "lords-of-the-north", completed_at: "2012-05-01 17:42:26-07"},
    %{book_slug: "sword-song", completed_at: "2012-05-31 17:43:54-07"},
    %{book_slug: "where-the-red-fern-grows", completed_at: "2012-06-01 17:45:38-07"},
    %{book_slug: "unbroken", completed_at: "2012-07-31 17:47:11-07"},
    %{book_slug: "prey", completed_at: "2012-08-31 17:48:34-07"},
    %{book_slug: "the-complete-sherlock-holmes", completed_at: "2012-09-01 17:50:04-07"},
    %{book_slug: "angelas-ashes", completed_at: "2012-09-30 17:52:54-07"},
    %{book_slug: "how-the-irish-saved-civilization", completed_at: "2012-10-01 17:57:54-07"},
    %{book_slug: "the-cider-house-rules", completed_at: "2012-10-31 17:59:31-07"},
    %{book_slug: "some-remarks", completed_at: "2012-11-30 17:01:16-08"},
    %{book_slug: "the-mongoliad", completed_at: "2012-12-01 17:03:26-08"},
    %{book_slug: "a-brief-history-of-time", completed_at: "2012-12-31 17:06:32-08"},
    %{book_slug: "literary-brooklyn", completed_at: "2013-01-01 17:08:12-08"},
    %{book_slug: "scottsboro", completed_at: "2013-01-02 17:09:46-08"},
    %{book_slug: "american-gods", completed_at: "2013-02-28 17:11:26-08"},
    %{book_slug: "the-rise-and-fall-of-the-third-reich", completed_at: "2013-04-30 18:14:14-07"},
    %{book_slug: "tesla-man-out-of-time", completed_at: "2013-06-30 18:15:50-07"},
    %{book_slug: "for-us-the-living", completed_at: "2013-12-14 17:17:24-08"},
    %{book_slug: "napoleon-bonaparte-a-life", completed_at: "2013-12-30 17:18:28-08"},
    %{book_slug: "1491", completed_at: "2014-01-29 16:16:05-08"},
    %{book_slug: "the-idea-factory", completed_at: "2014-02-14 07:08:19-08"},
    %{book_slug: "blink", completed_at: "2014-02-20 11:17:02-08"},
    %{book_slug: "freedom-tm", completed_at: "2014-04-13 05:02:15-07"},
    %{book_slug: "year-of-the-king", completed_at: "2014-05-19 05:35:45-07"},
    %{book_slug: "nothing-like-it-in-the-world", completed_at: "2014-08-01 14:41:47-07"},
    %{book_slug: "game-of-thrones", completed_at: "2014-08-08 05:43:55-07"},
    %{book_slug: "little-brother", completed_at: "2014-08-09 14:46:29-07"},
    %{book_slug: "the-money-book-for-freelancers", completed_at: "2014-08-19 08:31:28-07"},
    %{
      book_slug: "going-clear-scientology-hollywood-and-the-prison-of-belief",
      completed_at: "2014-10-22 09:33:18-07"
    },
    %{
      book_slug: "quiet-the-power-of-introverts-in-a-world-that-cant-stop-talking",
      completed_at: "2014-12-25 17:36:54-08"
    },
    %{book_slug: "the-alienist", completed_at: "2015-01-28 20:27:06-08"},
    %{book_slug: "the-mongoliad-book-two", completed_at: "2015-02-18 08:33:05-08"},
    %{
      book_slug: "mastermind-how-to-think-like-sherlock-holmes",
      completed_at: "2015-02-28 09:41:48-08"
    },
    %{
      book_slug: "fugitives-and-refugees-a-walk-in-portland-oregon",
      completed_at: "2015-03-10 09:39:02-07"
    },
    %{book_slug: "early-portland-stump-town-triumphant", completed_at: "2015-03-22 15:26:56-07"},
    %{
      book_slug: "the-paradox-of-choice-why-more-is-less",
      completed_at: "2015-03-29 09:12:38-07"
    },
    %{book_slug: "a-spell-for-chameleon", completed_at: "2015-04-02 00:59:57-07"},
    %{book_slug: "the-right-stuff", completed_at: "2015-04-17 21:36:38-07"},
    %{book_slug: "vb6", completed_at: "2015-04-30 12:43:07-07"},
    %{book_slug: "how-we-got-to-now", completed_at: "2015-05-06 12:45:21-07"},
    %{book_slug: "red-notice", completed_at: "2015-05-09 12:46:52-07"},
    %{book_slug: "code", completed_at: "2015-06-27 10:16:36-07"},
    %{book_slug: "the-world-according-to-garp", completed_at: "2015-08-04 09:20:08-07"},
    %{book_slug: "the-martian", completed_at: "2015-09-22 09:08:52-07"},
    %{book_slug: "the-mythical-man-month", completed_at: "2015-10-09 08:39:22-07"},
    %{book_slug: "ready-player-one", completed_at: "2015-11-12 09:08:43-08"},
    %{book_slug: "angel-killer", completed_at: "2015-11-17 09:34:32-08"},
    %{book_slug: "lincoln", completed_at: "2015-12-18 09:28:51-08"},
    %{book_slug: "the-tipping-point", completed_at: "2015-12-23 09:53:56-08"},
    %{book_slug: "coraline", completed_at: "2015-12-25 17:46:12-08"},
    %{book_slug: "the-better-angels-of-our-nature", completed_at: "2016-01-17 16:34:50-08"},
    %{book_slug: "mans-search-for-meaning", completed_at: "2016-01-24 16:40:38-08"},
    %{book_slug: "seveneves", completed_at: "2016-02-07 18:01:23-08"},
    %{book_slug: "the-everything-store", completed_at: "2016-02-27 18:47:33-08"},
    %{book_slug: "the-innovators", completed_at: "2016-03-22 18:47:56-07"},
    %{book_slug: "name-of-the-devil", completed_at: "2016-03-29 18:52:01-07"},
    %{book_slug: "interface", completed_at: "2016-04-12 18:36:51-07"},
    %{book_slug: "cobweb", completed_at: "2016-04-25 08:06:28-07"},
    %{book_slug: "zodiac", completed_at: "2016-05-02 17:58:32-07"},
    %{book_slug: "the-big-u", completed_at: "2016-05-09 07:56:36-07"},
    %{book_slug: "snowcrash", completed_at: "2016-05-29 21:05:13-07"},
    %{book_slug: "the-diamond-age", completed_at: "2016-06-19 21:08:49-07"},
    %{book_slug: "cryptonomicon", completed_at: "2016-07-09 21:11:03-07"},
    %{book_slug: "the-expectant-father", completed_at: "2016-07-12 21:15:31-07"},
    %{book_slug: "quicksilver", completed_at: "2016-11-01 00:00:00-07"},
    %{
      book_slug: "presto-how-i-made-over-100-pounds-disappear-and-other-magical-tales",
      completed_at: "2016-11-09 00:00:00-08"
    },
    %{
      book_slug: "the-millionaire-next-door-the-surprising-secrets-of-americas-wealthy",
      completed_at: "2016-11-21 00:00:00-08"
    },
    %{book_slug: "the-rewind-files", completed_at: "2016-12-04 00:00:00-08"},
    %{book_slug: "the-confusion", completed_at: "2016-12-10 00:00:00-08"},
    %{book_slug: "the-man-in-the-high-castle", completed_at: "2016-12-12 00:00:00-08"},
    %{book_slug: "reminiscences-of-a-stock-operator", completed_at: "2016-12-21 00:00:00-08"},
    %{
      book_slug:
        "undaunted-courage-meriwether-lewis-thomas-jefferson-the-opening-of-the-american-west",
      completed_at: "2016-12-29 00:00:00-08"
    },
    %{book_slug: "linux-pocket-guide", completed_at: "2017-01-01 00:00:00-08"},
    %{book_slug: "the-zen-programmer", completed_at: "2017-01-08 00:00:00-08"},
    %{book_slug: "filters-against-folly", completed_at: "2017-01-08 00:00:00-08"},
    %{book_slug: "portnoys-complaint", completed_at: "2017-01-15 00:00:00-08"},
    %{book_slug: "the-garden-of-eden", completed_at: "2017-01-21 00:00:00-08"},
    %{book_slug: "american-on-purpose", completed_at: "2017-01-26 00:00:00-08"},
    %{book_slug: "altered-carbon", completed_at: "2017-02-03 00:00:00-08"},
    %{book_slug: "public-radio-behind-the-voices", completed_at: "2017-02-10 00:00:00-08"},
    %{book_slug: "memoirs-of-a-geisha", completed_at: "2017-02-15 00:00:00-08"},
    %{book_slug: "the-zombie-survival-guide", completed_at: "2017-02-18 00:00:00-08"},
    %{
      book_slug:
        "symphony-for-the-city-of-the-dead-dmitri-shostakovich-and-the-siege-of-leningrad",
      completed_at: "2017-02-21 00:00:00-08"
    },
    %{
      book_slug: "gods-wasps-stranglers-the-secret-history-redemptive-future-of-fig-trees",
      completed_at: "2017-02-25 00:00:00-08"
    },
    %{book_slug: "republic-lost", completed_at: "2017-03-04 00:00:00-08"},
    %{book_slug: "portland-noir", completed_at: "2017-03-05 00:00:00-08"},
    %{book_slug: "rich-dad-poor-dad", completed_at: "2017-03-09 00:00:00-08"},
    %{book_slug: "dreamland", completed_at: "2017-03-17 00:00:00-07"},
    %{book_slug: "hardcore-zen", completed_at: "2017-03-20 00:00:00-07"},
    %{book_slug: "corellis-mandolin", completed_at: "2017-03-25 00:00:00-07"},
    %{
      book_slug: "practical-object-oriented-design-in-ruby",
      completed_at: "2017-04-02 00:00:00-07"
    },
    %{book_slug: "food-matters", completed_at: "2017-04-08 00:00:00-07"},
    %{book_slug: "postgresql-up-running", completed_at: "2017-04-12 00:00:00-07"},
    %{book_slug: "green-hills-of-africa", completed_at: "2017-04-19 21:00:00-07"},
    %{book_slug: "ghost-in-the-wires", completed_at: "2017-04-21 21:00:00-07"},
    %{book_slug: "reading-portland", completed_at: "2017-05-01 00:00:00-07"},
    %{book_slug: "the-japanese-mind", completed_at: "2017-05-16 00:00:00-07"},
    %{book_slug: "if-chins-could-kill", completed_at: "2017-05-31 00:00:00-07"},
    %{
      book_slug: "dirk-gentlys-holistic-detective-agency",
      completed_at: "2017-07-02 00:00:00-07"
    },
    %{book_slug: "oil", completed_at: "2017-07-02 00:00:00-07"},
    %{book_slug: "the-new-father", completed_at: "2017-07-04 00:00:00-07"},
    %{book_slug: "the-long-dark-tea-time-of-the-soul", completed_at: "2017-07-09 00:00:00-07"},
    %{book_slug: "the-system-of-the-world", completed_at: "2017-08-16 00:00:00-07"},
    %{book_slug: "effective-devops", completed_at: "2017-08-27 00:00:00-07"},
    %{book_slug: "killers-of-the-flower-moon", completed_at: "2017-08-31 00:00:00-07"},
    %{book_slug: "scaling-up-excellence", completed_at: "2017-09-09 00:00:00-07"},
    %{book_slug: "strong-fathers-strong-daughters", completed_at: "2017-09-13 00:00:00-07"},
    %{book_slug: "murder-on-the-orient-express", completed_at: "2017-09-17 00:00:00-07"},
    %{book_slug: "remains-of-the-day", completed_at: "2017-09-25 00:00:00-07"},
    %{book_slug: "the-mysterious-affair-at-styles", completed_at: "2017-10-01 00:00:00-07"},
    %{book_slug: "the-righteous-mind", completed_at: "2017-11-08 00:00:00-08"},
    %{book_slug: "the-road-to-little-dribbling", completed_at: "2017-11-21 00:00:00-08"},
    %{book_slug: "the-left-hand-of-darkness", completed_at: "2017-11-26 00:00:00-08"},
    %{book_slug: "between-the-world-and-me", completed_at: "2017-12-03 00:00:00-08"},
    %{book_slug: "never-let-me-go", completed_at: "2017-12-10 00:00:00-08"},
    %{
      book_slug: "elon-musk-tesla-spacex-and-the-quest-for-a-fantastic-future",
      completed_at: "2017-12-22 00:00:00-08"
    },
    %{book_slug: "the-snows-of-kilimanjaro", completed_at: "2017-12-28 00:00:00-08"},
    %{book_slug: "hillbilly-elegy", completed_at: "2018-01-06 00:00:00-08"},
    %{book_slug: "cloud-atlas", completed_at: "2018-01-19 00:00:00-08"},
    %{book_slug: "hitch-22", completed_at: "2018-02-03 12:58:00-08"},
    %{book_slug: "hidden-figures", completed_at: "2018-02-14 13:04:00-08"},
    %{book_slug: "fooling-houdini", completed_at: "2018-02-18 13:11:00-08"},
    %{
      book_slug: "robert-oppenheimer-a-life-inside-the-center",
      completed_at: "2018-03-03 13:14:00-08"
    },
    %{book_slug: "lovecraft-country", completed_at: "2018-03-09 13:18:00-08"},
    %{book_slug: "the-internet-of-money-vol-1", completed_at: "2018-03-10 13:20:00-08"},
    %{book_slug: "the-internet-of-money-vol-2", completed_at: "2018-03-17 13:23:00-07"},
    %{book_slug: "docker-for-php-developers", completed_at: "2018-03-25 13:56:00-07"},
    %{book_slug: "introducing-go", completed_at: "2018-04-01 13:26:00-07"},
    %{book_slug: "cloud-native-go", completed_at: "2018-04-02 13:28:00-07"},
    %{book_slug: "soul-of-a-citizen", completed_at: "2018-04-17 13:31:00-07"},
    %{book_slug: "the-elements-of-style", completed_at: "2018-04-25 13:34:00-07"},
    %{book_slug: "the-mongoliad-book-three", completed_at: "2018-05-08 13:38:00-07"},
    %{book_slug: "mastering-bitcoin", completed_at: "2018-05-17 13:41:00-07"},
    %{book_slug: "eat-to-live", completed_at: "2018-05-22 13:43:00-07"},
    %{book_slug: "i-love-books", completed_at: "2018-05-25 13:46:00-07"},
    %{book_slug: "the-naturalist", completed_at: "2018-05-27 13:50:00-07"},
    %{book_slug: "the-richest-man-in-babylon", completed_at: "2018-06-01 12:16:00-07"},
    %{book_slug: "for-whom-the-bell-tolls", completed_at: "2018-06-19 19:13:00-07"},
    %{book_slug: "a-river-in-darkness", completed_at: "2018-06-22 20:58:00-07"},
    %{book_slug: "introducing-elixir", completed_at: "2018-06-25 21:02:00-07"},
    %{book_slug: "anansi-boys", completed_at: "2018-07-14 08:50:00-07"},
    %{book_slug: "secondhand-time", completed_at: "2018-07-28 07:42:00-07"},
    %{book_slug: "mindfulness-for-beginners", completed_at: "2018-08-02 17:03:00-07"},
    %{book_slug: "enlightenment-now", completed_at: "2018-08-12 17:08:00-07"},
    %{book_slug: "the-gift-of-failure", completed_at: "2018-08-20 15:17:00-07"},
    %{book_slug: "everyday-blessings", completed_at: "2018-08-27 15:21:00-07"},
    %{book_slug: "factfulness", completed_at: "2018-09-18 19:32:00-07"},
    %{book_slug: "the-good-jobs-strategy", completed_at: "2018-09-26 20:12:00-07"},
    %{book_slug: "a-wild-sheep-chase", completed_at: "2018-10-02 11:10:00-07"},
    %{book_slug: "hear-the-wind-sing", completed_at: "2018-10-13 20:57:00-07"},
    %{book_slug: "pinball-1973", completed_at: "2018-10-13 21:05:00-07"},
    %{book_slug: "dance-dance-dance", completed_at: "2018-10-17 14:21:00-07"},
    %{book_slug: "1q84", completed_at: "2018-11-15 19:39:00-08"},
    %{book_slug: "fire-at-edens-gate", completed_at: "2018-11-27 19:16:00-08"},
    %{book_slug: "how-toddlers-thrive", completed_at: "2018-11-29 20:36:00-08"},
    %{book_slug: "stubborn-attachments", completed_at: "2018-12-04 20:39:00-08"},
    %{book_slug: "letters-to-a-young-contrarian", completed_at: "2018-12-10 07:08:00-08"},
    %{book_slug: "men-explain-things-to-me", completed_at: "2018-12-16 19:34:00-08"},
    %{book_slug: "the-wind-up-bird-chronicle", completed_at: "2018-12-28 08:18:00-08"},
    %{book_slug: "the-old-man-and-the-sea", completed_at: "2018-12-31 08:53:00-08"},
    %{book_slug: "the-obstacle-is-the-way", completed_at: "2019-01-13 07:25:00-08"},
    %{book_slug: "men-without-women", completed_at: "2019-01-14 07:26:00-08"},
    %{book_slug: "alan-turning-the-enigma", completed_at: "2019-02-15 19:35:00-08"},
    %{book_slug: "elixir-in-action", completed_at: "2019-03-16 21:05:00-07"},
    %{book_slug: "madame-curie-a-biography", completed_at: "2019-04-04 19:43:00-07"},
    %{book_slug: "the-life-of-andrew-jackson", completed_at: "2019-05-04 14:53:00-07"},
    %{book_slug: "http2-in-action", completed_at: "2019-05-26 20:51:00-07"},
    %{
      book_slug: "grace-hopper-and-the-invention-of-the-information-age",
      completed_at: "2019-06-08 09:10:00-07"
    },
    %{book_slug: "meditations", completed_at: "2019-06-22 11:20:00-07"},
    %{book_slug: "the-rust-programming-language", completed_at: "2019-06-22 11:22:00-07"},
    %{book_slug: "seven-databases-in-seven-weeks", completed_at: "2019-07-10 07:38:00-07"},
    %{book_slug: "the-emperor-wears-no-clothes", completed_at: "2019-07-27 15:05:00-07"},
    %{book_slug: "hybrid", completed_at: "2019-10-05 13:00:00-07"},
    %{book_slug: "phoenix-in-action", completed_at: "2019-10-29 18:58:00-07"},
    %{book_slug: "the-rise-and-fall-of-dodo", completed_at: "2019-12-24 13:16:00-08"},
    %{book_slug: "programming-phoenix-14", completed_at: "2019-12-27 13:18:00-08"},
    %{
      book_slug: "tmux-2-productive-mouse-free-development",
      completed_at: "2019-12-27 13:25:00-08"
    },
    %{book_slug: "caring-discipline", completed_at: "2020-01-24 13:26:00-08"},
    %{book_slug: "to-have-and-have-not", completed_at: "2020-01-25 20:26:00-08"},
    %{book_slug: "ego-is-the-enemy", completed_at: "2020-01-28 12:00:00-08"},
    %{book_slug: "across-the-river-and-into-the-trees", completed_at: "2020-01-31 12:02:00-08"},
    %{book_slug: "stillness-is-the-key", completed_at: "2020-02-06 12:04:00-08"},
    %{book_slug: "churchill", completed_at: "2020-02-16 20:24:00-08"},
    %{book_slug: "digital-minimalism", completed_at: "2020-02-22 11:58:00-08"}
  ]

  def seed_authors do
    Enum.each(@author_data, fn author ->
      struct(Author, author)
      |> Repo.insert(on_conflict: :nothing)
    end)

    IO.puts("inserted authors")
  end

  def seed_books do
    Enum.each(@book_data, fn book ->
      struct(Book, book)
      |> Repo.insert(on_conflict: :nothing)
    end)

    IO.puts("inserted books")
  end

  def seed_authorship do
    Enum.each(@authorship_data, fn authorship ->
      book = Library.get_book_by_slug!(authorship.book_slug)
      author = Library.get_author_by_slug!(authorship.author_slug)

      Library.add_author_to_book(book, author)
    end)
  end
end
