function speak(text) {
    const synth = window.speechSynthesis;
    const utterance = new SpeechSynthesisUtterance(text);
    utterance.lang = 'es-ES';  // Configura el idioma a español
    synth.speak(utterance);
}

document.addEventListener('focusin', (event) => {
    const focusedElement = document.activeElement;

    if (focusedElement.tagName === 'A') {
        const textToRead = focusedElement.textContent.trim();
        speak(textToRead);
    }
    else if (focusedElement.tagName === 'INPUT') {
        if (focusedElement.value.trim() === null || focusedElement.value.trim() === "") {
            const textToRead = focusedElement.placeholder.trim();
            speak(textToRead);
        }
        else if (focusedElement.value.trim().length === 1) {
        }
        else {
            const textToRead = focusedElement.value.trim();
            speak(textToRead);
        }
    }
    else if (focusedElement.tagName === 'BUTTON') {
        const textToRead = focusedElement.textContent.trim();
        speak(textToRead);
    }
    //else if (focusedElement.tagName === 'SELECT') {
    //    const textToRead = focusedElement.text.trim();
    //    speak(textToRead);
    //}
});