function CMAP = ez_gradation(cvec, cnum) 
%	EZ_GRADATION	�����̃J���[�x�N�g������O���f�[�V�����̃J���[�}�b�v���쐬����B
%	
%	EZ_GRADATION(CVEC)�́C�����̃J���[�x�N�g��CVEC����O���f�[�V�������쐬���C�F��64�̃J���[�}�b�v���쐬����B
%	EZ_GRADATION(CVEC, CNUM)�́C�����̃J���[�x�N�g��CVEC����O���f�[�V�������쐬���C�F��CNUM�̃J���[�}�b�v���쐬����B
%
%	MATLAB�̎d�l�ɂ��A�J���[�}�b�v�̒����͔C��(MS-Windows��Macintosh��ł�256�܂�)�ł��B
%
%	��:
%		���̗�͐���Ԃ֕ς��F��64�̃J���[�}�b�v��C�Ƃ��Ď擾���܂��B
%		C = ez_gradation([[0,0,1];[1,0,0]])
%	
%		���̗�͔�����A����ɐԂ֕ς��F��256�̃J���[�}�b�v��C�Ƃ��Ď擾���܂��B
%		C = ez_gradation([[1,1,1];[0,0,1];[1,0,0]], 256)

% --
%	���̊֐�ez_gradation()�́Alinspacem()���K�v�ł��B
%	�����T�C�g�����肵�Ă��������B
% --
%	Title : EZ_GRADATION()
%	Author : Sach1o : http://sach1o.blog80.fc2.com/
%	Created : 2007/12/04
% //-- 

% �F���̃f�t�H���g�F64
if nargin==1 
	cnum=64;
end;

% ���̓J���[�x�N�g���̃`�F�b�N
if ~isreal(cvec) | mod(numel(cvec),3)~=0 | any(cvec<0) | any(cvec>1) 
	error('�F�̎w�肪�s���ł�'); 
end;
% ���͐F���̃`�F�b�N
if (cnum~=floor(cnum) | numel(cnum)~=1 | cnum<=0 )
	error('�F���́A���̐����̃X�J���łȂ���΂Ȃ�܂���B');
end;

% ���̓J���[�}�b�v����`���
cvec = reshape(cvec(:), floor(numel(cvec)/3), 3);

if numel(cvec)==3 
	CMAP =repmat(cvec, cnum, 1);
else 
	sz = length(cvec(:,1));
	sind = floor(linspace(1,cnum,sz));
	sdiv = diff(sind) + 1;

	CMAP =zeros(cnum,3);
	for ii=1:sz-1 
		CMAP(sind(ii):sind(ii+1),:) = linspacem(cvec(ii,:), cvec(ii+1,:), sdiv(ii));
	end;
end;
