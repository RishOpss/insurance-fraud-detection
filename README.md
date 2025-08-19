# 🛡️ Insurance Fraud Detection System

A comprehensive Flask web application that uses machine learning to detect potential insurance fraud. The system features user authentication, a detailed insurance claim form, and ML-powered fraud analysis with beautiful, responsive UI.

## 🌟 Features

### 🔐 Authentication System
- **User Registration** - Create new accounts with username/password
- **Secure Login** - Password hashing with Werkzeug security
- **Session Management** - Secure user sessions
- **MySQL Database** - Persistent user data storage

### 📋 Insurance Claim Form
- **22+ Input Fields** - Comprehensive claim data collection
- **Smart Defaults** - Pre-selected reasonable values for faster form completion
- **Organized Sections**:
  - Customer Information (demographics, occupation, education)
  - Financial Information (deductibles, coverage, monetary gains/losses)
  - Incident Details (time, severity, vehicles involved, witnesses)
  - Claim Amounts (injury, property, vehicle damage claims)
- **Form Validation** - Client and server-side validation
- **Responsive Design** - Works on desktop and mobile devices

### 🤖 Machine Learning Integration
- **Random Forest Model** - Trained fraud detection algorithm
- **Feature Engineering** - Automatic encoding of categorical variables
- **Risk Assessment** - Intelligent fraud probability calculation
- **Fallback System** - Smart simulation when model unavailable

### 🎨 Modern UI/UX
- **Beautiful Design** - Modern gradient themes and animations
- **Responsive Layout** - Mobile-first design approach
- **Interactive Elements** - Smooth hover effects and transitions
- **Professional Results** - Color-coded fraud detection results
- **Flash Messages** - User-friendly notifications

## 🚀 Quick Start

### Prerequisites
- Docker and Docker Compose
- Git

### Installation & Running

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd insurance-fraud-detection
   ```

2. **Build and start with Docker**
   ```bash
   docker-compose up --build
   ```

3. **Access the application**
   - Open your browser and go to: `http://localhost:5000`
   - MySQL database will be available on: `localhost:3306`

4. **Stop the application**
   ```bash
   docker-compose down
   ```

## 🏗️ Architecture

### Technology Stack
- **Backend**: Flask (Python 3.9.6)
- **Database**: MySQL 8.0
- **ML Library**: scikit-learn 0.24.2
- **Frontend**: HTML5, CSS3, JavaScript
- **Containerization**: Docker & Docker Compose

### Project Structure
```
insurance-fraud-detection/
├── app.py                 # Main Flask application
├── requirements.txt       # Python dependencies
├── runtime.txt           # Python version specification
├── Dockerfile            # Docker container configuration
├── docker-compose.yml    # Multi-container Docker setup
├── .dockerignore         # Docker build exclusions
├── static/
│   └── css/
│       └── style.css     # Modern responsive styling
├── templates/
│   ├── base.html         # Base template with navigation
│   ├── home.html         # Landing page
│   ├── register.html     # User registration
│   ├── login.html        # User login
│   ├── insert.html       # Insurance claim form
│   ├── dashboard.html    # User dashboard
│   └── results.html      # Fraud detection results
└── README.md             # This file
```

## 🔧 Configuration

### Environment Variables
The application uses the following environment variables (automatically set in Docker):

- `MYSQL_HOST`: Database host (default: db)
- `MYSQL_DATABASE`: Database name (default: flaskapp)
- `MYSQL_USER`: Database user (default: flaskuser)
- `MYSQL_PASSWORD`: Database password (default: password)

### Database Schema
```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password TEXT NOT NULL
);
```

## 🎯 Usage Guide

### 1. Registration/Login
- Navigate to the home page
- Click "Register" to create a new account
- Or click "Login" if you already have an account
- After successful login, you'll be redirected to the insurance form

### 2. Filing an Insurance Claim
- Fill out the comprehensive insurance form
- All dropdown fields have smart defaults pre-selected
- Required fields are marked and validated
- Click "Analyze for Fraud" to submit

### 3. Viewing Results
- Get instant fraud detection results
- See risk level assessment (High Risk/Low Risk)
- View eligibility status (Eligible/Not Eligible)
- Read personalized recommendations
- Navigate back to file another claim or go to dashboard

## 🤖 Machine Learning Model

### Features Used (45 total)
- **Numerical**: months_policy_active, deductible_amount, extra_liability, monetary_gains, monetary_loss, incident_hour, vehicles_involved, bodily_injuries, witnesses, injury_claim, property_claim, vehicle_claim, bodily_injury_coverage
- **Categorical (One-hot encoded)**: 
  - Gender, Education Level, Occupation (13 categories)
  - Dependents (5 categories), Incident Type (3 categories)
  - Collision Type (2 categories), Authority Contacted (4 categories)
  - Incident Severity, Property Damage, Police Report

### Model Compatibility
- Trained with scikit-learn 0.24.2
- Handles version compatibility issues gracefully
- Falls back to intelligent simulation if model unavailable
- Risk-based prediction algorithm as backup

## 🐳 Docker Configuration

### Services
- **web**: Flask application container
- **db**: MySQL 8.0 database container

### Volumes
- `db_data`: Persistent MySQL data storage

### Networks
- `app-network`: Bridge network for container communication

### Health Checks
- Database health monitoring
- Automatic service dependency management

## 🔍 Development

### Local Development Setup
```bash
# Create virtual environment
python3.9 -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run locally (requires local MySQL)
python app.py
```

### Docker Development
```bash
# Build and run in development mode
docker-compose up --build

# View logs
docker-compose logs -f web
docker-compose logs -f db

# Access container shell
docker-compose exec web bash
docker-compose exec db mysql -u flaskuser -p flaskapp
```

## 📊 API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/` | GET | Home page |
| `/register` | GET/POST | User registration |
| `/login` | GET/POST | User login |
| `/logout` | GET | User logout |
| `/insert` | GET | Insurance claim form |
| `/predict` | POST | Fraud detection analysis |
| `/dashboard` | GET | User dashboard |

## 🛠️ Troubleshooting

### Common Issues

**Database Connection Failed**
```bash
# Check if MySQL container is running
docker-compose ps

# View database logs
docker-compose logs db

# Restart services
docker-compose restart
```

**Model Compatibility Issues**
- The app automatically handles scikit-learn version mismatches
- Uses intelligent simulation as fallback
- Check logs for model loading status

**Port Already in Use**
```bash
# Stop existing containers
docker-compose down

# Check what's using port 5000
lsof -i :5000

# Kill process if needed
kill -9 <PID>
```

## 🔒 Security Features

- **Password Hashing**: Werkzeug PBKDF2 with salt
- **SQL Injection Protection**: Parameterized queries
- **Session Security**: Flask secure sessions
- **Input Validation**: Server-side form validation
- **Docker Security**: Non-root container execution

## 📈 Performance

- **Lightweight**: Optimized Docker images
- **Fast Loading**: Efficient CSS and minimal JavaScript
- **Database Indexing**: Optimized MySQL queries
- **Caching**: Static file caching
- **Responsive**: Mobile-optimized interface

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Flask framework for the web application
- scikit-learn for machine learning capabilities
- MySQL for reliable data storage
- Docker for containerization
- Bootstrap-inspired CSS for responsive design

## 📞 Support

For support, please open an issue in the GitHub repository or contact the development team.

---

**Built with ❤️ for insurance fraud detection**