const darkBtn = document.getElementById('dark-btn');
const lightBtn = document.getElementById('light-btn');
const body = document.body;

// 1. Check for saved theme in localStorage on load
const savedTheme = localStorage.getItem('theme');

if (savedTheme === 'light') {
    body.classList.add('light-theme');
}

// 2. Event Listeners for buttons
darkBtn.addEventListener('click', () => {
    body.classList.remove('light-theme');
    localStorage.setItem('theme', 'dark'); // Save preference
});

lightBtn.addEventListener('click', () => {
    body.classList.add('light-theme');
    localStorage.setItem('theme', 'light'); // Save preference
});