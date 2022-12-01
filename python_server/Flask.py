from flask import Flask, render_template, request, send_from_directory
from werkzeug.utils import secure_filename
import uuid
import json
import os

app = Flask(__name__)

app.config['UPLOAD_FOLDER'] = 'static/upload/'

@app.route('/decode', methods=['POST'])
def decode():

    # 1.获取上传的文件
    f = request.files['file']
    fname = secure_filename(f.filename)
    filepath = os.path.join(app.config['UPLOAD_FOLDER'], fname)
    f.save(filepath)

    # 2.开始解析
    tt = os.system('python /Users/meme/Desktop/么么/log/crypt/decode_mars_crypt_log_file.py ' + filepath)

    # 3.返回解析后的文件
    return send_from_directory(app.config['UPLOAD_FOLDER'], fname + '.log', as_attachment=True)

# 本机ip
app.run(host='192.168.11.61', port=8999, debug=True)