function y = linspacem(d1, d2, n) 
% LINSPACEM 2�̃x�N�g���A�܂���2�̍s��̐��`�ɓ��Ԋu�ȃx�N�g���̍쐬
%
% Y = linspacem(X1, X2)
% Y = linspacem(X1, X2, n)
%
% ���� X1,X2 �̃N���X�T�|�[�g:
%    float: double, single
%
% ���́FX1,X2,n
%  X1, X2 - �����T�C�Y��2�̃x�N�g���A�܂���2�̍s��
%  n - ������(�f�t�H���g��100)
%
% �o�́FY
%  Y - ���`�ɓ��Ԋu�ȃx�N�g��
%
%	�� :
%	2�_(0, 0, 0)�A(3, 2, 4)�Ԃ̓��Ԋu��100�̓_��̍쐬
%		linspacem([0,0,0], [3,2,4])
%		linspacem([0;0;0], [3;0;4])
%	
%	2�_(0, 0, 0, 0)�A(3, 2, 4, 5)�Ԃ̓��Ԋu��10�̓_��̍쐬
%		linspacem([0;0;0;0], [3;0;4;5], 10)
%	
%	2�̍s�����`��10���������s��Q�̍쐬
%		linspacem([[0;0],[0;0]], [[3;4],[3;3]], 10)
%
%	�Q�l LINSPACE LOGSPACE
% 
% --
%	Title : LINSPACEM()
%	Author : Sach1o : hTTp://sach1o.blog80.fc2.com/
%	Created : 2007/11/27
% //--

if nargin == 2 n = 100; end;
n = floor(n);

sz = size(d1);
if ~isequal(sz, size(d2)) error('2�̓��͂̎������قȂ�܂��B'); end;

% x,y,z...�Ǝ�����ς��č��W��\�����ꍇ
if min(sz)==1 && length(sz)>2
	sz(2) = n;
	d1 = d1(:);
	d2 = d2(:);
	y = reshape([repmat(d1,1,n) + (d2-d1)*((0:(n-1))/(n-1))]', sz);
% �c�x�N�g��
elseif sz(2)==1 
	y = repmat(d1,1,n) + (d2-d1)*((0:(n-1))/(n-1));
% ���x�N�g��
elseif sz(1)==1 
	y = repmat(d1,n,1) + ((0:(n-1))/(n-1))'*(d2-d1);
% �s��
else 
	d1 = d1(:);
	d2 = d2(:);
	y = reshape( (repmat(d1,1,n) + (d2-d1)*((0:(n-1))/(n-1))), [sz,n]);
end;
