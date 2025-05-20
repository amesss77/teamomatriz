// Animación de "Te Amo" estilo Matrix en un canvas HTML

const canvas = document.createElement('canvas');
const ctx = canvas.getContext('2d');
document.body.style.margin = 0;
canvas.width = window.innerWidth;
canvas.height = window.innerHeight;
document.body.appendChild(canvas);

// Texto a animar
const mensaje = 'mi mujer camila';

// Configuración de columnas y letras
const fontSize = 32;
const columns = Math.floor(canvas.width / fontSize);
const drops = Array(columns).fill(1);

// Paleta de verdes estilo Matrix
const colorVerde = () => {
  const verdes = ['#00FF41', '#39FF14', '#00FF99', '#00FFB3', '#A3FF00'];
  return verdes[Math.floor(Math.random() * verdes.length)];
};

function draw() {
  // Fondo semitransparente para efecto de "trailing"
  ctx.fillStyle = 'rgba(0, 0, 0, 0.05)';
  ctx.fillRect(0, 0, canvas.width, canvas.height);

  ctx.font = fontSize + 'px monospace';
  ctx.textAlign = 'center';

  for (let i = 0; i < columns; i++) {
    // Seleccionamos una letra de "TE AMO" aleatoria para cada columna
    const letra = mensaje[Math.floor(Math.random() * mensaje.length)];
    ctx.fillStyle = colorVerde();

    const x = i * fontSize + fontSize / 2;
    const y = drops[i] * fontSize;

    ctx.fillText(letra, x, y);

    // Reiniciar la caída aleatoriamente para simular cascada
    if (y > canvas.height && Math.random() > 0.975) {
      drops[i] = 0;
    }

    drops[i]++;
  }

  requestAnimationFrame(draw);
}

draw();

// Adaptar el canvas si cambia el tamaño de la ventana
window.addEventListener('resize', () => {
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;
});