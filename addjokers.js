let jokers = [
  {
    name: "Devilish Joker",
    text: [
      "{X:mult,C:white}x3{} Mult if played",
      "hand contains only {C:attention}6s{}",
      "or {C:attention}Gold Cards{}"
    ],
    image_url: "assets/1x/j_devilish.png",
    rarity: "Uncommon"
  },
  {
    name: "Devoted Joker",
    text: [
      "When {C:attention}Boss Blind{} is selected",
      "gain {X:mult,C:white}x0.5{} Mult, then",
      "set your {C:attention}money{} to {C:attention}$0{}",
      "{C:inactive}(Currently {X:mult,C:white}x1{C:inactive})"
    ],
    image_url: "assets/1x/j_devoted.png",
    rarity: "Rare"
  },
  {
    name: "Mind Mage",
    text: [
      "{C:attention}+3{} hand size",
      "Discard the 2 rightmost",
      "cards per hand played"
    ],
    image_url: "assets/1x/j_mind_mage.png",
    rarity: "Uncommon"
  },
  {
    name: "Sentai Joker",
    text: [
      "Gains {C:mult}+6{} Mult per",
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
      "get {C:attention}$2{} when you",
      "{C:attention}sell{} a card"
    ],
    image_url: "assets/1x/j_pawn.png",
    rarity: "Common"
  },
  {
    name: "Fortuno",
    text: [
      "Whenever you score a",
      "{C:attention}numbered card{} in your",
      "first hand each round,",
      "destroy it and gain {C:attention}$3{}"
    ],
    image_url: "assets/1x/j_fortuno.png",
    rarity: "Legendary"
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
    name: "Suspicous Vase",
    text: [
      "All {C:attention}2s{}, {C:attention}3s{} and {C:attention}4s{}",
      "become {C:attention}Glass Cards{}",
      "when played."
    ],
    image_url: "assets/1x/j_suspicious_vase.png",
    rarity: "Uncommon"
  }
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
  DARK_EDITION: "#000000",
  ETERNAL: "#c75985",
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
  "Legendary": "#b26cbb"
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
  joker_div.innerHTML = `
    <h3>${joker.name}</h3>
    <img src="${joker.image_url}" alt="${joker.name}" />
    <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
    <div class="text">${joker.text}</div>
  `;

  jokers_div.appendChild(joker_div);
}