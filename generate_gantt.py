import matplotlib.pyplot as plt
import numpy as np

# Definir las fases en orden natural (de arriba hacia abajo)
fases = [
    "Entrenamiento y Documentación",
    "Pruebas y Ajustes",
    "Implementación Infraestructura",
    "Diseño de Arquitectura",
    "Evaluación Inicial"
]

semanas = np.arange(0, 10)  # Semanas de 0 a 9

# Definir la asignación de fases a semanas (1 = activo, 0 = inactivo)
cronograma = np.array([
    [0, 0, 0, 0, 0, 0, 0, 0, 1],  # Entrenamiento y Documentación (Semana 9)
    [0, 0, 0, 0, 0, 0, 1, 1, 0],  # Pruebas y Ajustes (Semana 7-8)
    [0, 0, 0, 1, 1, 1, 0, 0, 0],  # Implementación Infraestructura (Semana 4-6)
    [0, 1, 1, 0, 0, 0, 0, 0, 0],  # Diseño de Arquitectura (Semana 2-3)
    [1, 0, 0, 0, 0, 0, 0, 0, 0]   # Evaluación Inicial (Semana 0)
])

fig, ax = plt.subplots(figsize=(12, 6))

# Corrección de las sombras
ax.axvspan(0, 1, color="lightgray", alpha=0.3)  # Semana 0
ax.axvspan(3, 6, color="gray", alpha=0.3)  # Semana 3 a 6
ax.axvspan(8, 9, color="lightgray", alpha=0.3)  # Semana 9 (corregida)

# Crear el diagrama de Gantt con fases bien diferenciadas
for i, fase in enumerate(fases):
    semanas_activas = np.where(cronograma[i] == 1)[0]
    if semanas_activas.size > 0:
        ax.barh(
            fase,
            width=len(semanas_activas),
            left=semanas_activas[0],
            color="royalblue",
            alpha=0.8
        )

# Etiquetas y formato
ax.set_xlabel("Semanas", fontsize=12)
ax.set_ylabel("Fases del Proyecto", fontsize=12)
ax.set_xticks(semanas)
ax.set_xticklabels(semanas, fontsize=10)
ax.set_title("Cronograma del Proyecto", fontsize=14)
plt.grid(axis="x", linestyle="--", alpha=0.7)

ax.axvline(x=9, color='red', linestyle='--', linewidth=2)

plt.tight_layout()
plt.show()
