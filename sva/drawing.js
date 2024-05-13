pulseWidth = 20;

function drawClock(ctx, x, y, cycles) {

    ctx.font = "normal 14px Noto Sans";
    ctx.fillStyle = 'black';
    ctx.moveTo(x , y);
    ctx.fillText("clk", x, y);
    ctx.lineWidth = 1;
    ctx.strokeStyle = 'blue';
    ctx.beginPath();
    ox = x + 20;
    ctx.moveTo(ox , y);
    for (let i = 0; i < cycles; i++) {
        ctx.lineTo(ox+i*2*pulseWidth, y - pulseWidth);
        ctx.lineTo(ox+(i*2+1)*pulseWidth, y - pulseWidth);
        ctx.lineTo(ox+(i*2+1)*pulseWidth, y);
        ctx.lineTo(ox+((i+1)*2)*pulseWidth, y);
    }
    ctx.stroke();
}

// Get the canvas element
var canvas = document.getElementById('drawing');
var ctx = canvas.getContext('2d');

drawClock(ctx, 10, 50, 10);
