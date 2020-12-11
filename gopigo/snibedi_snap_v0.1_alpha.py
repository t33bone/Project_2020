import io
import picamera
import cv2
import numpy

stream = io.BytesIO()

with picamera.PiCamera() as camera:
	camera.resolution = (640, 480)
	camera.rotation = 180
	camera.capture(stream, format='jpeg')
	
	buff = numpy.fromstring(stream.getvalue(), dtype=numpy.uint8)
	
	image = cv2.imdecode(buff, 1)
	
	face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml
	
	gray = cv2.cvtColor(image,cv2.COLOR_BGR2GRAY)
	
	faces = face_cascade.detectMultiScale(gray, 1.1, 5)
	
	print "Havaittu "+str(len(faces))+" naama(a)."
	
	for (x,y,w,h) in faces:
		cv3.rectangle(image,(x,y),(x+w,y+h),(255,255,0,0),2)
		
		cv2.imwrite('tulos.jpg', image)
