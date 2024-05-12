let jokers = [
  {
    name: "Fortuno",
    text: [
      "Whenever you score a",
      "{C:attention}numbered card{} in your",
      "first hand each round,",
      "destroy it and gain {C:attention}$3{}"
    ],
    image_url: "assets/1x/j_fortuno.png",
    rarity: "Legendary",
    soul: true
  },
  {
    name: "Feste",
    text: [
      "Upgrade the first hand",
      "you play each {C:attention}Boss Blind{}",
      "by {C:attention}4{} levels"
    ],
    image_url: "assets/1x/j_feste.png",
    rarity: "Legendary",
    soul: true
  },
  {
    name: "Stańczyk",
    text: [
      "Retrigger {C:attention}Enhanced Cards{}",
      "that are played or",
      "held in hand"
    ],
    image_url: "assets/1x/j_stanczyk.png",
    rarity: "Legendary",
    soul: true
  },
  {
    name: "Midnight Crew",
    text: [
      "This Joker gains {X:mult,C:white} X0.5 {}",
      "Mult if scoring hand contains a {C:attention}Flush{}",
      "{C:attention}of{} {C:clubs}Clubs{}. Changes",
      "suit after every blind",
      "{C:inactive}(Currently {X:mult,C:white}X1{C:inactive})"
    ],
    image_url: "assets/1x/j_midnight_crew.png",
    rarity: "Legendary",
    soul: true
  },
  {
    name: "Self Portrait",
    text: [
      "This Joker gains {X:mult,C:white}X0.1{}",
      "Mult whenever you {C:attention}use a Tarot card{}.",
      "Changes every blind.",
      "{C:inactive}(Currently {X:mult,C:white}X1{}{C:inactive} Mult){}"
    ],
    image_url: "assets/1x/j_self_portrait.png",
    rarity: "Rare"
  },  
  {
    name: "Devoted Joker",
    text: [
      "When {C:attention}Boss Blind{} is selected",
      "gain {X:mult,C:white}X0.5{} Mult, then",
      "set your {C:attention}money{} to {C:attention}$0{}",
      "{C:inactive}(Currently {X:mult,C:white}X1{C:inactive})"
    ],
    image_url: "assets/1x/j_devoted.png",
    rarity: "Rare"
  },
  {
    name: "Old Man Joker",
    text: [
      "When {C:attention}Boss Blind{} is selected",
      "create a free {C:attention}Ethereal Tag{}"
    ],
    image_url: "assets/1x/j_old_man.png",
    rarity: "Rare"
  },
  {
    name: "Lieutenant Joker",
    text: [
      "After you play a {C:attention}High Card{}",
      "increase the {C:attention}rank{}",
      "of each card played."
    ],
    image_url: "assets/1x/j_lieutenant.png",
    rarity: "Rare"
  },
  {
    name: "Shady Dealer",
    text: [
      "Sell this card to create",
      "a free {C:attention}Negative Tag{}"
    ],
    image_url: "assets/1x/j_shady_dealer.png",
    rarity: "Rare"
  },
  {
    name: "Cut the Cheese",
    text: [
      "When {C:attention}Blind{} is selected",
      "create a random {C:attention}Food Joker{}",
      "{C:inactive}(Must have room){}"
    ],
    image_url: "assets/1x/j_cut_the_cheese.png",
    rarity: "Rare"
  },
  {
    name: "Boredom Slayer",
    text: [
      "Reduce {C:attention}Blind{} requirements",
      "by {C:attention}10%{} whenever you",
      "play a hand",
    ],
    image_url: "assets/1x/j_boredom_slayer.png",
    rarity: "Rare"
  },
  {
    name: "Devilish Joker",
    text: [
      "{X:mult,C:white}X3{} Mult if played",
      "hand contains only {C:attention}6s{}",
      "or {C:attention}Gold Cards{}"
    ],
    image_url: "assets/1x/j_devilish.png",
    rarity: "Uncommon"
  },
  {
    name: "Mural Menace",
    text: [
      "Create a random {C:attention}Tag{}",
      "when you skip a {C:attention}Blind{}"
    ],
    image_url: "assets/1x/j_mural_menace.png",
    rarity: "Uncommon"
  },
  {
    name: "Impractical Joker",
    text: [
      "{X:mult,C:white}X3{} Mult if {C:attention}poker hand{}",
      "is a {C:attention}High Card{},",
      "poker hand changes",
      "on every scoring"
    ],
    image_url: "assets/1x/j_impractical.png",
    rarity: "Uncommon"
  },
  {
    name: "Box of Stuff",
    text: [
      "When {C:attention}Boss Blind{} is selected",
      "create three free {C:attention}Standard Tags{},",
      "then destroy this card"
    ],
    image_url: "assets/1x/j_box_of_stuff.png",
    rarity: "Uncommon"
  },
  {
    name: "Wanted Poster",
    text: [
      "Gain {C:attention}$10{} when you",
      "beat a {C:attention}Blind{} first hand.",
      "Lose {C:attention}$2{} when you play",
      "a hand past your first"
    ],
    image_url: "assets/1x/j_wanted_poster.png",
    rarity: "Uncommon"
  },
  {
    name: "Suspicous Vase",
    text: [
      "All {C:attention}2s{}, {C:attention}3s{} and {C:attention}4s{}",
      "become {C:attention}Glass Cards{} and",
      "give {X:mult,C:white}X2{} Mult when played."
    ],
    image_url: "assets/1x/j_suspicious_vase.png",
    rarity: "Uncommon"
  },
  {
    name: "Memorable Joker",
    text: [
      "This Joker gains {X:mult,C:white}X0.1{}",
      "Mult for each consecutive played hand",
      "containing exactly {C:attention}3{} cards",
      "{C:inactive}(Currently {X:mult,C:white}X1{}{C:inactive} Mult){}"
    ],
    image_url: "assets/1x/j_memorable.png",
    rarity: "Uncommon"
  },
  {
    name: "Tapestry Joker",
    text: [
      "This Joker gains {C:mult}+4{} Mult for",
      "each unique consumable used",
      "{C:inactive}(Currently {C:mult}+0{}{C:inactive} Mult){}"
    ],
    image_url: "assets/1x/j_tapestry.png",
    rarity: "Uncommon"
  },
  {
    name: "Sentai Joker",
    text: [
      "Gains {C:mult}+8{} Mult per",
      "{C:attention}Planet{} card used, resets",
      "when {C:attention}Boss Blind{} is defeated",
      "{C:inactive}(Currently {C:mult}+0{C:inactive} Mult)"
    ],
    image_url: "assets/1x/j_sentai.png",
    rarity: "Common"
  },
  {
    name: "Pawn Joker",
    text: [
      "{C:green}1 in 2{} chance to",
      "get {C:attention}$3{} when you",
      "{C:attention}sell{} a card"
    ],
    image_url: "assets/1x/j_pawn.png",
    rarity: "Common"
  },
  {
    name: "Expanded Art Joker",
    text: [
      "{C:attention}Enhanced Cards{} gives",
      "{C:chips}+30{} Chips when scored"
    ],
    image_url: "assets/1x/j_expanded_art.png",
    rarity: "Common"
  },
  {
    name: "Highlander Joker",
    text: [
      "Every scoring card permanently",
      "gains {C:chips}+20{} Chips when scored if",
      "your hand is a {C:attention}High Card{}."
    ],
    image_url: "assets/1x/j_highlander.png",
    rarity: "Common"
  },
  {
    name: "Scrapper Joker",
    text: [
      "{C:green}1 in 3{} chance to create a",
      "random {C:attention}Planet{} card when",
      "you discard five {C:attention}numbered{} cards"
    ],
    image_url: "assets/1x/j_scrapper.png",
    rarity: "Common"
  },
  {
    name: "Sir Joker",
    text: [
      "{X:mult,C:white}X1.5{} Mult during",
      "{C:attention}Boss Blinds{} or",
      "or your {C:attention}final hand{}"
    ],
    image_url: "assets/1x/j_sir.png",
    rarity: "Common"
  },
  {
    name: "Makeshift Joker",
    text: [
      "Gains {C:mult}+1{} Mult per",
      "{C:attention}card{} sold",
      "{C:inactive}(Currently {C:mult}+0{C:inactive} Mult)"
    ],
    image_url: "assets/1x/j_makeshift.png",
    rarity: "Common"
  },
  {
    name: "Minimalist Joker",
    text: [
      "{C:mult}+10{} Mult if played hand",
      "contains no {C:attention}face cards{}"
    ],
    image_url: "assets/1x/j_minimalist.png",
    rarity: "Common"
  },
  {
    name: "Ternary System",
    text: [
      "Create a {C:planet}Planet{} card",
      "if played hand contains {C:attention}3{}",
      "cards and a {C:attention}Three of a Kind{}",
      "{C:inactive}(Must have room)"
    ],
    image_url: "assets/1x/j_ternary_system.png",
    rarity: "Common"
  },
  {
    name: "Chicken Scratch",
    text: [
      "Gains {C:chips}+5{} Chips if",
      "scoring hand contains",
      "an {C:attention}8{}, {C:attention}7{}, or {C:attention}3{}",
      "{C:inactive}(Currently {C:chips}+20{C:inactive} Chips){}"
    ],
    image_url: "assets/1x/j_chicken_scratch.png",
    rarity: "Common"
  },
  {
    name: "Chalk Outline",
    text: [
      "This Joker gains {C:mult}+6{} Mult",
      "whenever you play",
      "your {C:attention}final hand{}",
      "{C:inactive}(Currently {C:mult}+0{C:inactive} Mult){}"
    ],
    image_url: "assets/1x/j_chalk_outline.png",
    rarity: "Common"
  },
  {
    name: "Cardslinger",
    text: [
      "{C:chips}+10{} Chips for each",
      "time a card scored",
      "this hand"
    ],
    image_url: "assets/1x/j_cardslinger.png",
    rarity: "Common"
  },
  {
    name: "Pitiful Joker",
    text: [
      "{C:mult}+10{} Mult if",
      "played hand is a",
      "{C:attention}High Card{} or {C:attention}Pair{}"
    ],
    image_url: "assets/1x/j_pitiful.png",
    rarity: "Common"
  },
  {
    name: "Sunday Funnies",
    text: [
      "Create a random {C:planet}Planet{}",
      "or {C:tarot}Tarot{} card per 2",
      "{C:attention}rerolls{} in the shop",
      "{C:inactive}({C:green}2{}{C:inactive} rerolls left){}",
      "{C:inactive}(Must have room){}",
    ],
    image_url: "assets/1x/j_sunday_funnies.png",
    rarity: "Common"
  }
]

// works the same. 
let consumables = [
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Tarot"
  // },
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Planet"
  // },
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Spectral"
  // },
]

let cols = {
  
  MULT: "#FE5F55",
  CHIPS: "#009dff",
  MONEY: "#f3b958",
  XMULT: "#FE5F55",
  FILTER: "#ff9a00",
  ATTENTION: "#ff9a00",
  BLUE: "#009dff",
  RED: "#FE5F55",
  GREEN: "#4BC292",
  PALE_GREEN: "#56a887",
  ORANGE: "#fda200",
  IMPORTANT: "#ff9a00",
  GOLD: "#eac058",
  YELLOW: "#ffff00",
  CLEAR: "#00000000", 
  WHITE: "#ffffff",
  PURPLE: "#8867a5",
  BLACK: "#374244",
  L_BLACK: "#4f6367",
  GREY: "#5f7377",
  CHANCE: "#4BC292",
  JOKER_GREY: "#bfc7d5",
  VOUCHER: "#cb724c",
  BOOSTER: "#646eb7",
  EDITION: "#ffffff",
  DARK_EDITION: "#5d5dff",
  ETERNAL: "#c75985",
  INACTIVE: "#ffffff99",
  DYN_UI: {
    MAIN: "#374244",
    DARK: "#374244",
    BOSS_MAIN: "#374244",
    BOSS_DARK: "#374244",
    BOSS_PALE: "#374244"
  },
  SO_1: {
    Hearts: "#f03464",
    Diamonds: "#f06b3f",
    Spades: "#403995",
    Clubs: "#235955",
  },
  SO_2: {
    Hearts: "#f83b2f",
    Diamonds: "#e29000",
    Spades: "#4f31b9",
    Clubs: "#008ee6",
  },
  SUITS: {
      Hearts: "#FE5F55",
      Diamonds: "#FE5F55",
      Spades: "#374649",
      Clubs: "#424e54",
  },
  
  SET: {
    Default: "#cdd9dc",
    Enhanced: "#cdd9dc",
    Joker: "#424e54",
    Tarot: "#424e54",
    Planet: "#424e54",
    Spectral: "#424e54",
    Voucher: "#424e54",
  }, 
  SECONDARY_SET: {
    Default: "#9bb6bdFF",
    Enhanced: "#8389DDFF",
    Joker: "#708b91",
    Tarot: "#a782d1",
    Planet: "#13afce",
    Spectral: "#4584fa",
    Voucher: "#fd682b",
    Edition: "#4ca893",
  },
}

let rarities = {
  "Common": "#009dff", 
  "Uncommon": "#4BC292",
  "Rare": "#fe5f55",
  "Legendary": "#b26cbb",
  "Joker": "#708b91",
  "Tarot": "#a782d1",
  "Planet": "#13afce",
  "Spectral": "#4584fa",
  "Voucher": "#fd682b",
  "Edition": "#4ca893",
}

regex = /{([^}]+)}/g;

let jokers_div = document.querySelector(".jokers");

for (let joker of jokers) {
  console.log("adding joker", joker.name);

  joker.text = joker.text.map((line) => { return line + "{}"});

  joker.text = joker.text.join("<br/>");
  joker.text = joker.text.replaceAll("{}", "</span>");
  joker.text = joker.text.replace(regex, function replacer(match, p1, offset, string, groups) {
    let classes = p1.split(",");

    let css_styling = "";

    for (let i = 0; i < classes.length; i++) {
      let parts = classes[i].split(":");
      if (parts[0] === "C") {
        css_styling += `color: ${cols[parts[1].toUpperCase()]};`;
      } else if (parts[0] === "X") {
        css_styling += `background-color: ${cols[parts[1].toUpperCase()]}; border-radius: 5px; padding: 0 5px;`;
      }
    }

    return `</span><span style='${css_styling}'>`;
  });

  let joker_div = document.createElement("div");
  joker_div.classList.add("joker");
  if (joker.soul) {
    joker_div.innerHTML = `
      <h3>${joker.name}</h3>
      <span class="soulholder">
        <img src="${joker.image_url}" alt="${joker.name}" class="soul-bg" />
        <img src="${joker.image_url}" alt="${joker.name}" class="soul-top" />
      </span>
      <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
      <div class="text">${joker.text}</div>
    `;
  } else {
    joker_div.innerHTML = `
      <h3>${joker.name}</h3>
      <img src="${joker.image_url}" alt="${joker.name}" />
      <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
      <div class="text">${joker.text}</div>
    `;
  }

  jokers_div.appendChild(joker_div);
}

if (consumables.length === 0) {
  document.querySelector(".consumableshidebydefault").style.display = "none"
}

let consumables_div = document.querySelector(".consumables");

for (let consumable of consumables) {
  console.log("adding consumable", consumable.name);

  consumable.text = consumable.text.map((line) => { return line + "{}"});

  consumable.text = consumable.text.join("<br/>");
  consumable.text = consumable.text.replaceAll("{}", "</span>");
  consumable.text = consumable.text.replace(regex, function replacer(match, p1, offset, string, groups) {
    let classes = p1.split(",");

    let css_styling = "";

    for (let i = 0; i < classes.length; i++) {
      let parts = classes[i].split(":");
      if (parts[0] === "C") {
        css_styling += `color: ${cols[parts[1].toUpperCase()]};`;
      } else if (parts[0] === "X") {
        css_styling += `background-color: ${cols[parts[1].toUpperCase()]}; border-radius: 5px; padding: 0 5px;`;
      }
    }

    return `</span><span style='${css_styling}'>`;
  });

  let consumable_div = document.createElement("div");
  consumable_div.classList.add("joker");
  if (consumable.soul) {
    consumable_div.innerHTML = `
      <h3>${consumable.name}</h3>
      <span class="soulholder">
        <img src="${consumable.image_url}" alt="${consumable.name}" class="soul-bg" />
        <img src="${consumable.image_url}" alt="${consumable.name}" class="soul-top" />
      </span>
      <h4 class="rarity" style="background-color: ${rarities[consumable.rarity]}">${consumable.rarity}</h4>
      <div class="text">${consumable.text}</div>
    `;
  } else {
    consumable_div.innerHTML = `
      <h3>${consumable.name}</h3>
      <img src="${consumable.image_url}" alt="${consumable.name}" />
      <h4 class="rarity" style="background-color: ${rarities[consumable.rarity]}">${consumable.rarity}</h4>
      <div class="text">${consumable.text}</div>
    `;
  }

  consumables_div.appendChild(consumable_div);
}