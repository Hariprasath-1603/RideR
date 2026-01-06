# 🎨 UI Component Showcase

## Visual Preview of All Components

### 🗺️ 1. Full-Screen Map Background
```
┌─────────────────────────────────────┐
│                                     │
│        🗺️ Google Maps               │
│                                     │
│     Roads, Buildings, POIs          │
│                                     │
│           📍 Your Location          │
│                                     │
│        Interactive & Zoomable       │
│                                     │
└─────────────────────────────────────┘
```
**Features:**
- Real-time location tracking
- Custom green marker for pickup
- Smooth pan and zoom
- My location button

---

### 👤 2. Profile Button
```
┌─────┐
│  👤 │  ← White circular button
└─────┘    Shadow: subtle
```
**Specs:**
- Size: 48x48 dp
- Background: #FFFFFF
- Icon: person_outline
- Shadow: 0px 2px 8px rgba(0,0,0,0.1)

---

### 🆘 3. SOS Emergency Button
```
┌──────────────┐
│  ⚠️  SOS    │  ← Red pill-shaped button
└──────────────┘
```
**Specs:**
- Background: #D32F2F (red)
- Text: White, bold
- Border Radius: 24px
- Shadow with red tint

---

### 🔍 4. Destination Search Bar
```
┌────────────────────────────────────────┐
│  ┌──┐                                  │
│  │🔍│  Where to?                  →   │
│  └──┘                                  │
└────────────────────────────────────────┘
```
**Features:**
- White background
- Large tap target (56dp height)
- Search icon in grey box
- Placeholder text: "Where to?"
- Arrow icon on right

**Visual Details:**
- Border Radius: 16px
- Shadow: Medium (12px blur)
- Padding: 20px horizontal

---

### 📍 5. Pickup Location Indicator
```
┌────────────────────────────────────────┐
│  🟢  Pickup Location              ✎   │
│      Current Location                  │
└────────────────────────────────────────┘
```
**Features:**
- Green pulsing dot
- Two-line layout
- Edit icon on right
- Auto-updates with GPS

**Visual Details:**
- Dot: 12x12 dp, #00C853
- Label: 11pt, grey
- Address: 14pt, bold black
- Border Radius: 12px

---

### 🚗 6. Vehicle Type Cards

#### 🏍️ Bike Card
```
┌──────────────┐
│  ┌────────┐  │
│  │  🏍️   │  │  ← Black icon box
│  └────────┘  │
│              │
│  Bike   👤1  │  ← Name + capacity
│              │
│  ₹49         │  ← Price (bold)
│  2 min       │  ← ETA
└──────────────┘
```
**Unselected:**
- Background: #F5F5F5
- Border: None
- Icon Box: Black

**Selected:**
- Background: Light green tint
- Border: 2px green
- Icon Box: Green
- Shadow: Green glow

---

#### 🛺 Auto Card
```
┌──────────────┐
│  ┌────────┐  │
│  │  🛺   │  │
│  └────────┘  │
│              │
│  Auto   👤3  │
│              │
│  ₹89         │
│  3 min       │
└──────────────┘
```

---

#### 🚗 Mini Car Card
```
┌──────────────┐
│  ┌────────┐  │
│  │  🚗   │  │
│  └────────┘  │
│              │
│  Mini   👤4  │
│              │
│  ₹129        │
│  4 min       │
└──────────────┘
```

---

#### 🚙 Sedan Card
```
┌──────────────┐
│  ┌────────┐  │
│  │  🚙   │  │
│  └────────┘  │
│              │
│  Sedan  👤4  │
│              │
│  ₹179        │
│  5 min       │
└──────────────┘
```

---

#### 🚐 SUV Card
```
┌──────────────┐
│  ┌────────┐  │
│  │  🚐   │  │
│  └────────┘  │
│              │
│  SUV    👤6  │
│              │
│  ₹249        │
│  6 min       │
└──────────────┘
```

**Card Specs:**
- Size: 130x140 dp
- Spacing: 12px
- Scroll: Horizontal
- Animation: 200ms on select

---

### 💳 7. Payment Method Selector
```
┌────────────────────────────────────────┐
│  💳  Payment: UPI                  →  │
└────────────────────────────────────────┘
```
**Features:**
- Light grey background
- Payment icon (20dp)
- Current method display
- Chevron indicator

**Visual Details:**
- Background: #F5F5F5
- Height: 48dp
- Border Radius: 12px
- Text: 14pt medium

---

### 🎯 8. Book Ride Button
```
┌────────────────────────────────────────┐
│                                        │
│             Book Ride                  │
│                                        │
└────────────────────────────────────────┘
```
**Normal State:**
- Background: #00C853 (green)
- Text: White, 18pt bold
- Height: 56dp
- Border Radius: 16px
- Full width

**Pressed State:**
- Background: #00A844 (darker green)
- Slight scale down (0.98)

**Disabled State:**
- Background: #BDBDBD (grey)
- Opacity: 60%

---

### 💰 9. Fare Estimate Text
```
     Estimated fare: ₹129
```
**Features:**
- Appears only when vehicle selected
- Center aligned
- Small, subtle text

**Visual Details:**
- Font Size: 13pt
- Color: #424242 (grey)
- Margin Top: 12px

---

## 🎬 Component States & Interactions

### Vehicle Card Selection Animation
```
Before:        After:
┌─────────┐    ┌─────────┐
│  🚗     │ →  │  🚗     │
│         │    │         │
│ ₹129    │    │ ₹129    │
└─────────┘    └─────────┘
Grey bg        Green border + tint
               + shadow glow
```
**Duration:** 200ms
**Easing:** ease-in-out

---

### Button Press Feedback
```
Normal:        Pressed:       Released:
┌──────────┐   ┌─────────┐   ┌──────────┐
│ Book     │ → │Book     │ → │ Book     │
└──────────┘   └─────────┘   └──────────┘
#00C853        #00A844       #00C853
Scale: 1.0     Scale: 0.98   Scale: 1.0
```
**Duration:** 100ms

---

## 📐 Component Hierarchy

```
BookingHomeScreen (Root)
│
├── Stack (Full Screen)
│   │
│   ├── GoogleMap (Background Layer)
│   │   └── Marker (Pickup Location)
│   │
│   ├── Positioned (Top Section)
│   │   ├── Container (Gradient Overlay)
│   │   │   ├── Row (Top Bar)
│   │   │   │   ├── ProfileButton
│   │   │   │   └── SOSButton
│   │   │   │
│   │   │   └── DestinationSearchBar
│   │   │
│   │   └── PickupLocationIndicator
│   │
│   └── Positioned (Bottom Section)
│       └── Container (Bottom Sheet)
│           ├── Text ("Choose your ride")
│           │
│           ├── ListView.builder (Vehicle Cards)
│           │   └── VehicleTypeCard (×5)
│           │
│           ├── Container (Payment Selector)
│           │
│           ├── ElevatedButton ("Book Ride")
│           │
│           └── Text (Fare Estimate)
```

---

## 🎨 Color Usage Map

### Component → Color Mapping

| Component | Background | Text/Icon | Border/Accent |
|-----------|-----------|-----------|---------------|
| **Map** | Google Maps | - | - |
| **Profile Button** | #FFFFFF | #212121 | Shadow |
| **SOS Button** | #D32F2F | #FFFFFF | Red shadow |
| **Search Bar** | #FFFFFF | #424242 | Shadow |
| **Search Icon Box** | #F5F5F5 | #212121 | - |
| **Location Card** | #FFFFFF | #212121 | Shadow |
| **Green Dot** | #00C853 | - | #00C853 (30%) |
| **Vehicle Card (Off)** | #F5F5F5 | #212121 | - |
| **Vehicle Card (On)** | #E8F5E9 | #00C853 | #00C853 (2px) |
| **Icon Box (Off)** | #212121 | #FFFFFF | - |
| **Icon Box (On)** | #00C853 | #FFFFFF | - |
| **Payment Selector** | #F5F5F5 | #424242 | - |
| **Book Button** | #00C853 | #FFFFFF | - |
| **Fare Text** | Transparent | #424242 | - |

---

## 📏 Component Dimensions Cheat Sheet

```
┌─────────────────────────────────────────┐
│  48dp    Profile/SOS buttons           │
│  56dp    Search bar, Book button       │
│  48dp    Payment selector              │
│  140dp   Vehicle cards (height)        │
│  130dp   Vehicle cards (width)         │
│  40dp    Icon boxes                    │
│  20-24dp Icons (medium-large)          │
│  16px    Standard padding              │
│  12px    Card spacing                  │
│  8-24px  Border radius range           │
└─────────────────────────────────────────┘
```

---

## 🔤 Typography Usage

```
┌─────────────────────────────────────────┐
│  18pt Bold    "Choose your ride"       │
│  18pt Bold    "Book Ride" button       │
│  16pt Bold    Vehicle prices           │
│  16pt Medium  "Where to?" text         │
│  14pt Bold    Vehicle names            │
│  14pt Medium  Payment text             │
│  14pt Semibold Current address         │
│  13pt Regular  Fare estimate           │
│  11pt Regular  ETA, labels             │
│  11pt Medium   "Pickup Location"       │
└─────────────────────────────────────────┘
```

---

## 🎭 Interactive States Summary

### Tap Targets
```
✓ Profile Button    : 48x48 dp
✓ SOS Button        : 48x48 dp (tappable area)
✓ Search Bar        : Full width × 56 dp
✓ Location Card     : Full width × 56 dp
✓ Vehicle Card      : 130x140 dp
✓ Payment Selector  : Full width × 48 dp
✓ Book Button       : Full width × 56 dp
```

### Feedback Types
```
✓ Visual   : Color change, border, shadow
✓ Scale    : Subtle 0.98x on press
✓ Animation: Smooth 100-200ms transitions
✓ Haptic   : (Can be added)
```

---

## 🌟 Special Effects

### Shadows
```
Small:   0px 2px 8px rgba(0,0,0,0.1)
         ↓
         Used for: Cards, indicators

Medium:  0px 4px 12px rgba(0,0,0,0.1)
         ↓
         Used for: Search bar

Large:   0px -4px 20px rgba(0,0,0,0.1)
         ↓
         Used for: Bottom sheet

Colored: 0px 2px 8px rgba(0,200,83,0.2)
         ↓
         Used for: Selected vehicle card (green)
         
         0px 2px 8px rgba(211,47,47,0.3)
         ↓
         Used for: SOS button (red)
```

### Gradients
```
Top Overlay (Map):
  From: rgba(33,33,33,0.3)  ← Dark
  To:   transparent         ← Clear
  Direction: Top → Bottom
```

### Green Dot Pulse (Location)
```
Core:   12x12 dp, #00C853
Border: 3px, rgba(0,200,83,0.3)
Effect: Pulsing animation (optional)
```

---

## 📱 Responsive Behavior

### Safe Areas
```
Top:    System status bar
Bottom: System navigation bar / Home indicator
Sides:  16px margin maintained
```

### Keyboard Appearance
```
When keyboard opens:
- Bottom sheet shrinks
- "Book Ride" button stays above keyboard
- Map remains visible
```

### Orientation
```
Portrait:  Primary design (recommended)
Landscape: Bottom sheet becomes side panel (future)
```

---

## 🎬 Animation Timeline

```
App Launch:
0ms     → Show splash screen
500ms   → Initialize map
1000ms  → Load current location
1500ms  → Animate camera to location
2000ms  → Update pickup address
2500ms  → Ready for interaction

Vehicle Selection:
0ms     → User taps card
0-200ms → Card animates (border, color)
200ms   → Selection complete
200ms   → Fare estimate appears

Book Ride:
0ms     → User taps button
0-100ms → Button press animation
100ms   → Show loading or navigate
```

---

**This showcase provides a complete visual reference for all UI components in the booking screen.**
