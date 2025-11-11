// JavaScript for interactive features
document.addEventListener('DOMContentLoaded', function() {

    // Smooth scrolling for navigation links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });

    // CTA Button interaction
    const ctaButton = document.querySelector('.cta-button');
    if (ctaButton) {
        ctaButton.addEventListener('click', function() {
            alert('Starting your DevOps journey! Check out the tools section below.');
            document.querySelector('#tools').scrollIntoView({ behavior: 'smooth' });
        });
    }

    // Simulate real-time metrics update
    function updateMetrics() {
        const successRate = Math.floor(Math.random() * 5) + 95; // 95-100%
        const deployTime = Math.floor(Math.random() * 3) + 3; // 3-6 min

        const metricCards = document.querySelectorAll('.metric-value');
        if (metricCards.length >= 3) {
            metricCards[0].textContent = successRate + '%';
            metricCards[1].textContent = deployTime + ' min';
        }
    }

    // Update metrics every 5 seconds
    setInterval(updateMetrics, 5000);

    // Add animation to tool cards on scroll
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);

    // Observe all tool cards
    document.querySelectorAll('.tool-card').forEach(card => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(20px)';
        card.style.transition = 'opacity 0.5s, transform 0.5s';
        observer.observe(card);
    });

    // Console welcome message
    console.log('%c Welcome to DevOps Project Guide! ', 
                'background: #667eea; color: white; font-size: 16px; padding: 10px;');
    console.log('Built with GitHub + Jenkins + Docker + Grafana');
});

// Function to check pipeline status (simulated)
function checkPipelineStatus() {
    const statuses = ['Building', 'Testing', 'Deploying', 'Success'];
    return statuses[Math.floor(Math.random() * statuses.length)];
}

// Export for use in other modules if needed
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { checkPipelineStatus };
}