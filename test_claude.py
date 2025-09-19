print("--- Я ЗАПУСКАЮ ПРАВИЛЬНЫЙ ФАЙЛ, ВЕРСИЯ 2 ---")
import anthropic

# Этот код создает "клиент", который будет отправлять запросы
# на ваш локальный прокси, а не на серверы Anthropic.
client = anthropic.Anthropic(
    # Ключ ANTHROPIC_API_KEY он подхватит из окружения (тот самый "dummy-key")
    base_url="http://127.0.0.1:3000",
)

print("Отправляю запрос к Claude через OpenRouter...")

# Здесь мы формируем и отправляем запрос
try:
    message = client.messages.create(
        # Важно: укажите модель, которая доступна на OpenRouter
        # Например, 'anthropic/claude-3-haiku' или 'anthropic/claude-3-sonnet'
        model="qwen/qwen3-coder:free",
        max_tokens=1024,
        messages=[
            {"role": "user", "content": "Привет! Расскажи короткий анекдот."}
        ]
    )
    # Печатаем ответ от модели
    print("Ответ получен:")
    print(message.content[0].text)

except Exception as e:
    print(f"Произошла ошибка: {e}")

