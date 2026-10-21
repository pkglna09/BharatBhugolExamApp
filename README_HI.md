# भारत भूगोल परीक्षा — Android APK प्रोजेक्ट

यह प्रोजेक्ट अपलोड की गई `भारत लेयर मैप (3).html` को Android WebView ऐप में पैक करता है। मूल HTML को `app/src/main/assets/index.html` में रखा गया है; उसकी मौजूदा JavaScript सुविधाएँ हटाई नहीं गई हैं।

## स्रोत फ़ाइल की जाँच

- HTML लगभग 566 KB है और इसमें भारत के राज्य/क्षेत्र SVG paths, खोज, लेयर, ज़ूम, क्विज़ और राज्य क्विज़ का कोड मौजूद है।
- HTML में बाहरी `https://` संसाधन नहीं मिले; नक्शे की सामग्री लोकल HTML में शामिल है।
- मूल HTML `localStorage` का उपयोग गलत उत्तरों को याद रखने के लिए करता है। Android WebView में DOM storage सक्षम है।
- साथ दी गई Markdown फ़ाइल में शीर्षक/संक्षिप्त निर्देश हैं; HTML मैप ही मुख्य कार्यशील स्रोत है।
- नक्शे में कुछ तथ्य/स्थान विवरण स्वयं स्रोत से आते हैं। परीक्षा उपयोग से पहले तथ्य-जाँच करना उचित है।

## आवश्यकताएँ

1. Windows 10/11
2. Android Studio (स्थिर संस्करण) और Android SDK Platform 35
3. JDK 17 (Android Studio का bundled JDK इस्तेमाल कर सकते हैं)
4. पहली बार Gradle/Android Gradle Plugin डाउनलोड करने के लिए इंटरनेट कनेक्शन

**महत्वपूर्ण:** APK चलने के बाद मैप ऑफलाइन चलता है। पहली बार Android Studio में प्रोजेक्ट सेटअप/Gradle dependencies डाउनलोड करने के लिए इंटरनेट लग सकता है।

## APK बनाने का तरीका

1. ZIP को किसी साधारण पथ में निकालें, जैसे `C:\AndroidProjects\BharatBhugolExamApp`.
2. Android Studio खोलें → **Open** → निकाला हुआ `BharatBhugolExamApp` फ़ोल्डर चुनें।
3. यदि SDK Platform 35 या Build Tools इंस्टॉल करने का संदेश आए तो SDK Manager से इंस्टॉल करें।
4. Gradle Sync पूरा होने दें।
5. मेनू में **Build → Build Bundle(s) / APK(s) → Build APK(s)** चुनें।
6. बनने वाली APK यहाँ मिलेगी:
   `app\build\outputs\apk\debug\app-debug.apk`
7. APK को फोन में भेजें और इंस्टॉल करें। फोन में आवश्यकता पड़ने पर “Install unknown apps” की अनुमति दें।

## वैकल्पिक कमांड

Android Studio में Gradle Sync पूरा होने के बाद प्रोजेक्ट के टर्मिनल में:
```bat
gradle assembleDebug
```
या यदि Gradle wrapper बाद में Android Studio ने बनाया हो:
```bat
gradlew.bat assembleDebug
```

## ऑफलाइन और गोपनीयता

- Manifest में `INTERNET` permission नहीं है।
- मैप HTML ऐप के भीतर शामिल है; नेटवर्क से मैप लोड नहीं होता।
- क्विज़ के गलत उत्तर डिवाइस के WebView local storage में सहेजे जाते हैं।
- ऐप में कोई ऑनलाइन AI/API सुविधा शामिल नहीं है।
- यह Debug APK है; Play Store वितरण के लिए अलग से signed release build बनाना होगा।

## परियोजना संरचना

- `app/src/main/assets/index.html` — मूल मैप HTML
- `app/src/main/java/in/chakachak/bharatmap/MainActivity.java` — Android WebView
- `app/src/main/AndroidManifest.xml` — ऐप कॉन्फ़िगरेशन
- `app/build.gradle` — Android build settings
- `SOURCE_NOTES.md` — अपलोड की गई Markdown फ़ाइल की प्रति

## वर्तमान सीमाएँ

यह पहला कार्यशील पैकेजिंग संस्करण है: इसमें मूल मैप/क्विज़ सुरक्षित रखे गए हैं और APK का ढाँचा तैयार है। अलग-अलग विषयों के विस्तृत अध्याय, नया प्रश्न-बैंक, टाइमर, रैंकिंग, बैकअप/सिंक और विस्तारित राज्य/ज़िला अध्ययन सामग्री अभी अलग से विकसित करनी होगी। वास्तविक APK को आपके Windows कंप्यूटर पर Android Studio से बिल्ड करना होगा; इस वातावरण में Android SDK के साथ APK compile/test नहीं किया गया है।
