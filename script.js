const ctx = document.getElementById('progressChart').getContext('2d');
const progressChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'],
    datasets: [{
      label: 'Калории',
      data: [2200, 2100, 2000, 2300, 2250, 2400, 2100],
      borderColor: 'rgba(75, 192, 192, 1)',
      fill: false
    }]
  },
  options: {
    responsive: true,
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});
const themeToggle = document.getElementById('theme-toggle');
themeToggle.addEventListener('click', () => {
  document.body.classList.toggle('dark-mode');
  document.querySelector('header').classList.toggle('dark-mode');
  document.querySelector('footer').classList.toggle('dark-mode');
});
if ('serviceWorker' in navigator) {
  navigator.serviceWorker.register('/sw.js')
    .then(() => console.log('Service Worker зарегистрирован'))
    .catch(error => console.error('Ошибка регистрации Service Worker:', error));
};