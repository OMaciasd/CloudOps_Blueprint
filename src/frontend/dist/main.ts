import { collectDefaultMetrics, Registry, Gauge } from 'prom-client';
import * as express from 'express';

const app = express();
const register = new Registry();

// Métricas por defecto (CPU, memoria, etc.)
collectDefaultMetrics({ register });

// Métrica personalizada (ejemplo)
const customGauge = new Gauge({
  name: 'example_custom_gauge',
  help: 'Un gauge de ejemplo',
});
customGauge.set(10); // puedes actualizarlo dinámicamente

app.get('/metrics', async (req, res) => {
  res.set('Content-Type', register.contentType);
  res.end(await register.metrics());
});

app.listen(9100, () => {
  console.log('Metrics server on http://localhost:9100/metrics');
});
