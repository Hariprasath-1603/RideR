# 🎨 Vehicle Booking Screen - Design Specifications

## Visual Design System

### 📐 Layout Structure

#### Screen Composition (Layer Stack)
```
┌─────────────────────────────────────┐
│ Full-Screen Google Maps (Background)│
│                                     │
│  ┌─────────────────────────────┐   │
│  │ Top Bar (Overlay)           │   │
│  │  [Profile] ... [SOS]        │   │
│  │                             │   │
│  │  ┌───────────────────────┐  │   │
│  │  │ "Where to?" Search    │  │   │
│  │  └───────────────────────┘  │   │
│  └─────────────────────────────┘   │
│                                     │
│  ┌─────────────────────────────┐   │
│  │ 📍 Pickup Location          │   │
│  └─────────────────────────────┘   │
│                                     │
│                                     │
│          [Map Marker]              │
│                                     │
│                                     │
│  ┌─────────────────────────────┐   │
│  │ Bottom Sheet (Overlay)      │   │
│  │                             │   │
│  │ Vehicle Cards [→→→→→]       │   │
│  │                             │   │
│  │ Payment Method              │   │
│  │                             │   │
│  │ ┌─────────────────────────┐ │   │
│  │ │    Book Ride Button     │ │   │
│  │ └─────────────────────────┘ │   │
│  └─────────────────────────────┘   │
└─────────────────────────────────────┘
```

---

## 🎯 Component Specifications

### 1. Top Bar Section
**Position**: Top of screen (Safe Area)
**Background**: Semi-transparent gradient overlay
**Padding**: 16px all sides

#### Profile Button
- **Type**: Circle icon button
- **Size**: 48x48 dp
- **Background**: #FFFFFF (white)
- **Icon**: person_outline
- **Icon Size**: 24 dp
- **Icon Color**: #212121
- **Shadow**: 0px 2px 8px rgba(0,0,0,0.1)

#### SOS Button
- **Type**: Pill-shaped button
- **Height**: 48 dp
- **Padding**: 16px horizontal, 12px vertical
- **Background**: #D32F2F (red)
- **Border Radius**: 24px
- **Shadow**: 0px 2px 8px rgba(211,47,47,0.3)
- **Content**: 
  - Icon: warning_rounded (20dp)
  - Text: "SOS" (14pt, bold)
  - Color: #FFFFFF

---

### 2. Destination Search Bar
**Position**: Below top bar (16px spacing)
**Width**: Screen width - 32px
**Margin**: 16px horizontal

#### Container
- **Height**: 56 dp
- **Background**: #FFFFFF
- **Border Radius**: 16px
- **Shadow**: 0px 4px 12px rgba(0,0,0,0.1)
- **Padding**: 20px horizontal, 16px vertical

#### Content Layout
```
┌──────────────────────────────────────┐
│ [🔍] Where to?              [→]     │
└──────────────────────────────────────┘
```

- **Search Icon Box**:
  - Size: 36x36 dp
  - Background: #F5F5F5
  - Border Radius: 8px
  - Icon: search (20dp, #212121)

- **Text**: "Where to?"
  - Font Size: 16pt
  - Color: #424242 (medium grey)
  - Weight: 500 (medium)

- **Arrow Icon**: arrow_forward_ios
  - Size: 16 dp
  - Color: #BDBDBD

---

### 3. Pickup Location Indicator
**Position**: Below search bar (16px spacing)
**Width**: Screen width - 32px
**Margin**: 16px horizontal

#### Container
- **Height**: Auto (min 56 dp)
- **Background**: #FFFFFF
- **Border Radius**: 12px
- **Shadow**: 0px 2px 8px rgba(0,0,0,0.1)
- **Padding**: 16px horizontal, 12px vertical

#### Content Layout
```
┌────────────────────────────────────┐
│ 🟢 Pickup Location           [✎]  │
│    Current Location                │
└────────────────────────────────────┘
```

- **Green Dot**:
  - Size: 12x12 dp
  - Color: #00C853
  - Border: 3px #00C853 (30% opacity)
  - Shape: Circle

- **Label**: "Pickup Location"
  - Font Size: 11pt
  - Color: #424242
  - Weight: 500

- **Address Text**:
  - Font Size: 14pt
  - Color: #212121
  - Weight: 600
  - Max Lines: 1

- **Edit Icon**: edit_location_alt
  - Size: 20 dp
  - Color: #BDBDBD

---

### 4. Bottom Sheet (Vehicle Selection)
**Position**: Bottom of screen
**Background**: #FFFFFF
**Border Radius**: 24px (top corners only)
**Shadow**: 0px -4px 20px rgba(0,0,0,0.1)
**Padding**: 20px all sides

#### Section Header
- **Text**: "Choose your ride"
- **Font Size**: 18pt
- **Color**: #212121
- **Weight**: Bold (700)
- **Margin Bottom**: 16px

---

### 5. Vehicle Type Card
**Dimensions**: 130x140 dp
**Spacing**: 12px between cards
**Layout**: Horizontal scroll

#### Unselected State
- **Background**: #F5F5F5 (light grey)
- **Border Radius**: 16px
- **Border**: None
- **Padding**: 16px

#### Selected State
- **Background**: #E8F5E9 (light green, 10% opacity)
- **Border Radius**: 16px
- **Border**: 2px solid #00C853
- **Shadow**: 0px 2px 8px rgba(0,200,83,0.2)
- **Padding**: 16px

#### Content Layout
```
┌──────────────────┐
│  ┌────────────┐  │
│  │  [🚗 Icon] │  │ Vehicle Icon Box
│  └────────────┘  │
│                  │
│  Mini       [👤1]│ Name + Capacity
│                  │
│  ₹129            │ Price
│  4 min           │ ETA
└──────────────────┘
```

#### Icon Box
- **Size**: 40x40 dp
- **Background**: #212121 (unselected) / #00C853 (selected)
- **Border Radius**: 8px
- **Icon Size**: 24 dp
- **Icon Color**: #FFFFFF

#### Vehicle Name
- **Font Size**: 14pt
- **Color**: #212121 (unselected) / #00C853 (selected)
- **Weight**: Bold (700)

#### Capacity Badge
- **Icon**: person (12dp)
- **Text**: Number
- **Font Size**: 11pt
- **Color**: #424242

#### Price
- **Font Size**: 16pt
- **Color**: #212121 (unselected) / #00C853 (selected)
- **Weight**: Bold (700)

#### ETA
- **Font Size**: 11pt
- **Color**: #424242
- **Weight**: Regular (400)

---

### 6. Payment Method Selector
**Margin Top**: 20px
**Height**: 48 dp

#### Container
- **Background**: #F5F5F5
- **Border Radius**: 12px
- **Padding**: 16px horizontal, 12px vertical

#### Content Layout
```
┌─────────────────────────────────────┐
│ [💳] Payment: UPI           [→]    │
└─────────────────────────────────────┘
```

- **Payment Icon**: payment (20dp)
- **Text**: "Payment: {method}"
  - Font Size: 14pt
  - Color: #424242
  - Weight: 500
- **Chevron**: chevron_right (20dp, #BDBDBD)

---

### 7. Book Ride Button
**Margin Top**: 16px
**Width**: 100% (full width)
**Height**: 56 dp

#### Style
- **Background**: #00C853 (primary green)
- **Border Radius**: 16px
- **Elevation**: 0 (flat design)
- **Pressed State**: #00A844 (darker green)

#### Text
- **Content**: "Book Ride"
- **Font Size**: 18pt
- **Color**: #FFFFFF
- **Weight**: Bold (700)
- **Alignment**: Center

#### Disabled State (no vehicle selected)
- **Background**: #BDBDBD
- **Text Color**: #FFFFFF
- **Opacity**: 60%

---

### 8. Fare Estimate Text
**Margin Top**: 12px
**Alignment**: Center

- **Text**: "Estimated fare: ₹XXX"
- **Font Size**: 13pt
- **Color**: #424242
- **Weight**: Regular (400)
- **Display**: Only when vehicle selected

---

## 📏 Spacing & Measurements

### Screen Margins
```
Top Safe Area: System defined
Side Margins: 16px
Bottom Safe Area: System defined
Inter-element spacing: 8-20px
```

### Component Heights
```
Top Bar Icons: 48dp
Search Bar: 56dp
Location Indicator: 56dp (min)
Vehicle Card: 140dp
Payment Selector: 48dp
Book Button: 56dp
```

### Border Radius Scale
```
Small: 8px (icon boxes)
Medium: 12px (cards)
Large: 16px (buttons, search)
Extra Large: 24px (bottom sheet, SOS)
```

### Shadow Scale
```
Small: 0px 2px 8px rgba(0,0,0,0.1)
Medium: 0px 4px 12px rgba(0,0,0,0.1)
Large: 0px -4px 20px rgba(0,0,0,0.1)
```

---

## 🎨 Color Palette Reference

### Primary Colors
```dart
primaryGreen:   #00C853  // Buttons, selected states
darkGreen:      #00A844  // Pressed states
accentBlue:     #2962FF  // Secondary accents
```

### Neutral Colors
```dart
pureWhite:      #FFFFFF  // Cards, containers
lightGrey:      #F5F5F5  // Subtle backgrounds
mediumGrey:     #BDBDBD  // Borders, disabled
darkGrey:       #424242  // Secondary text
almostBlack:    #212121  // Primary text
```

### Status Colors
```dart
warningRed:     #D32F2F  // SOS, alerts
successGreen:   #43A047  // Success states
infoBlue:       #1976D2  // Info elements
```

### Transparent Overlays
```dart
shadowColor:    rgba(0,0,0,0.1)    // 10% black
overlayColor:   rgba(0,0,0,0.2)    // 20% black
greenOverlay:   rgba(0,200,83,0.1) // 10% green
```

---

## 📱 Responsive Breakpoints

### Mobile (Default)
- **Width**: 320-428 dp
- **Design**: Single column layout
- **Vehicle Cards**: Horizontal scroll
- **Map**: Full screen

### Tablet (Future)
- **Width**: 768+ dp
- **Design**: Two-column layout possible
- **Vehicle Cards**: Grid layout
- **Map**: Partial screen

---

## ✨ Animation Specifications

### Card Selection
```dart
Duration: 200ms
Curve: easeInOut
Properties: background, border, shadow
```

### Button Press
```dart
Duration: 100ms
Curve: easeIn
Properties: background color, scale (0.98)
```

### Camera Movement
```dart
Duration: 1000ms
Curve: easeInOut
Property: map camera position
```

### Sheet Slide
```dart
Duration: 300ms
Curve: easeOut
Property: vertical position
```

---

## 🔤 Typography Scale

### Display
- **Size**: 28pt
- **Weight**: Bold (700)
- **Use**: Page titles

### Heading
- **Size**: 18pt
- **Weight**: Bold (700)
- **Use**: Section headers

### Subheading
- **Size**: 16pt
- **Weight**: Semibold (600)
- **Use**: Card titles, prices

### Body
- **Size**: 14pt
- **Weight**: Medium (500)
- **Use**: Main text, descriptions

### Caption
- **Size**: 11-13pt
- **Weight**: Regular (400)
- **Use**: Labels, supporting text

---

## 🖼️ Icon Guidelines

### Icon Set
- **Family**: Material Icons
- **Style**: Outlined (default), Filled (selected states)
- **Weight**: 400 (regular)

### Size Scale
```
Small: 16dp (chevrons, arrows)
Medium: 20dp (general UI)
Large: 24dp (primary actions)
Extra Large: 64dp (illustrations)
```

### Color Usage
```
Primary: #212121 (dark text)
Secondary: #424242 (medium text)
Disabled: #BDBDBD (light text)
Accent: #00C853 (selected/active)
Warning: #D32F2F (alerts)
```

---

## 🎭 State Design

### Interactive States

#### Buttons
1. **Default**: Primary color, no shadow
2. **Pressed**: Darker shade, slight scale
3. **Disabled**: Grey, reduced opacity
4. **Loading**: Spinner overlay

#### Cards
1. **Unselected**: Grey background
2. **Selected**: Green border + tint
3. **Pressed**: Scale 0.98
4. **Disabled**: Greyed out

#### Input Fields
1. **Default**: Light grey background
2. **Focused**: Blue border
3. **Error**: Red border
4. **Success**: Green border

---

## 📐 Grid System

### Base Unit: 8dp

```
4dp  = 0.5x (tight spacing)
8dp  = 1x   (standard spacing)
12dp = 1.5x (comfortable spacing)
16dp = 2x   (section spacing)
20dp = 2.5x (large spacing)
24dp = 3x   (major sections)
```

### Layout Grid
- **Columns**: Flexible (based on content)
- **Gutter**: 16dp
- **Margin**: 16dp (sides)

---

## 🎬 Micro-interactions

### Card Tap
```
Action: Tap vehicle card
Feedback: Scale 0.98 → 1.0 (100ms)
Result: Border appears, background tints
```

### Button Press
```
Action: Press "Book Ride"
Feedback: Background darkens (100ms)
Result: Navigate or show loading
```

### Map Interaction
```
Action: Pan/Zoom map
Feedback: Smooth gestures
Result: Camera position updates
```

### Location Update
```
Action: GPS location changes
Feedback: Marker animates to new position
Result: Address text updates
```

---

## 📋 Accessibility

### Minimum Touch Targets
- **Size**: 44x44 dp (minimum)
- **Spacing**: 8dp between targets

### Color Contrast
- **Text on Light**: 4.5:1 ratio minimum
- **Large Text**: 3:1 ratio minimum
- **Icons**: 3:1 ratio minimum

### Text Sizing
- **Minimum**: 11pt for body text
- **Scalable**: Support dynamic type
- **Line Height**: 1.4-1.6x font size

---

**This design system ensures consistency across the entire booking experience.**
