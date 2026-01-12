# Skiza Spin & Win - Django Promotional Website

A promotional web application where users can spin a wheel to win prizes, then subscribe to Skiza (Kenyan music service) to withdraw their winnings.

## 🎡 Features

- **Interactive Spin Wheel**: HTML5 Canvas-based spinning wheel with smooth animations
- **Session Management**: One spin per session to prevent abuse
- **Phone Number Validation**: Real-time validation for Kenyan phone numbers (07xxx, 01xxx)
- **M-Pesa Integration Ready**: Prize withdrawal via M-Pesa
- **Mobile-First Design**: Fully responsive with Tailwind CSS
- **Skiza Subscription Flow**: USSD code integration for Safaricom Skiza
- **Admin Dashboard**: Django admin for managing withdrawal requests

## 🚀 Quick Start

### Prerequisites

- Python 3.8 or higher
- pip (Python package manager)

### Installation

1. **Navigate to project directory:**
   ```bash
   cd skiza_promo
   ```

2. **Create virtual environment:**
   ```bash
   python -m venv venv
   ```

3. **Activate virtual environment:**
   - Windows:
     ```bash
     venv\Scripts\activate
     ```
   - Mac/Linux:
     ```bash
     source venv/bin/activate
     ```

4. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

5. **Run database migrations:**
   ```bash
   python manage.py makemigrations
   python manage.py migrate
   ```

6. **Create admin superuser:**
   ```bash
   python manage.py createsuperuser
   ```

7. **Run development server:**
   ```bash
   python manage.py runserver
   ```

8. **Access the application:**
   - Website: http://127.0.0.1:8000/
   - Admin: http://127.0.0.1:8000/admin/

## 📁 Project Structure

```
skiza_promo/
├── manage.py                 # Django management script
├── requirements.txt          # Python dependencies
├── skiza_project/           # Project configuration
│   ├── settings.py          # Django settings
│   ├── urls.py              # Root URL configuration
│   └── wsgi.py              # WSGI configuration
└── wheel_spin/              # Main application
    ├── models.py            # WithdrawalRequest model
    ├── views.py             # View functions
    ├── urls.py              # App URL routing
    ├── forms.py             # Form validation
    ├── admin.py             # Admin configuration
    └── templates/           # HTML templates
        └── wheel_spin/
            ├── base.html
            ├── loading.html
            ├── landing.html
            ├── withdrawal.html
            ├── subscription.html
            ├── confirmation.html
            ├── how_it_works.html
            ├── terms.html
            └── privacy.html
```

## 🎮 How It Works

1. **Loading Page**: Users see a 2-second loading animation
2. **Landing Page**: Interactive wheel with spin button
3. **Spin Wheel**: Users spin once per session (always wins Kshs 800)
4. **Win Modal**: Displays winning amount with "Withdraw Now" button
5. **Withdrawal Form**: Collects Kenyan phone number with validation
6. **Subscription Page**: Shows USSD code (*812*310#) to dial for Skiza
7. **Confirmation**: Processing status with 24-48 hour timeline

## 📱 Mobile Responsiveness

- Mobile-first design approach
- Touch-friendly buttons (minimum 44x44px)
- Responsive breakpoints for all screen sizes
- Optimized for 320px to 1920px widths

## 🔒 Security Features

- CSRF protection on all forms
- Session-based spin limiting
- Phone number validation (regex + server-side)
- XSS prevention (Django template autoescape)
- SQL injection prevention (Django ORM)

## 🎨 Design

- **Color Scheme**:
  - Primary: Orange (#FF6B35)
  - Secondary: Yellow (#FFD166)
  - Success: Green (#06D6A0)
  - Purple: #7209B7
- **Typography**: Inter font family from Google Fonts
- **Framework**: Tailwind CSS via CDN
- **Animations**: Smooth transitions and micro-interactions

## 🛠️ Admin Panel

Access the admin panel at `/admin/` to:
- View all withdrawal requests
- Filter by status (pending, processing, completed, failed)
- Search by phone number or session ID
- Bulk update request statuses
- Export data for reporting

## 📊 Database Model

**WithdrawalRequest**:
- `phone_number`: Kenyan phone (07xxx or 01xxx)
- `amount_won`: Prize amount
- `session_id`: User session tracking
- `status`: pending, processing, completed, failed
- `created_at`: Timestamp
- `updated_at`: Last modification

## 🌍 Kenyan Market Compliance

- Phone validation for Kenyan formats
- M-Pesa payment integration ready
- Skiza USSD code: *812*310#
- Timezone: Africa/Nairobi
- Subscription cost disclosure: Kshs 7/day
- Data protection compliance

## 📄 Legal Pages

- **Terms & Conditions**: Eligibility, subscription requirements, liability
- **Privacy Policy**: Data collection, usage, rights (Kenya Data Protection Act 2019)
- **How It Works**: User guide and FAQ

## 🚀 Production Deployment

1. Update `settings.py`:
   - Set `DEBUG = False`
   - Update `ALLOWED_HOSTS`
   - Set secure `SECRET_KEY`
   - Configure production database (PostgreSQL recommended)

2. Uncomment security settings in `settings.py`:
   - `SECURE_SSL_REDIRECT = True`
   - `SESSION_COOKIE_SECURE = True`
   - `CSRF_COOKIE_SECURE = True`

3. Collect static files:
   ```bash
   python manage.py collectstatic
   ```

4. Set up environment variables for sensitive data

## 📞 Support

- Email: support@skizapromo.co.ke
- Phone: +254 700 000 000
- Hours: Monday - Friday, 8AM - 6PM EAT

## 📝 License

This is a promotional project. All rights reserved.

---

Built with ❤️ for the Kenyan market
